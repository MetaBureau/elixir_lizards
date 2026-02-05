# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

ElixirLizards is a Phoenix 1.8 LiveView application using the Ash Framework for domain logic and authentication. It serves as both a working app and a component showcase for two UI libraries: DaisyUI and Mishka Chelekom.

## Common Commands

```bash
mix setup                      # Full project setup (deps, DB, assets, seeds)
mix phx.server                 # Start dev server
iex -S mix phx.server          # Start with IEx console
mix test                       # Run all tests (auto-runs ash.setup)
mix test test/path_test.exs    # Run a single test file
mix test --failed              # Re-run failed tests
mix precommit                  # Pre-commit checks: compile --warnings-as-errors, deps.unlock --unused, format, test
mix ash.setup                  # Create and migrate database
mix format                     # Format code (uses Spark.Formatter + Phoenix.LiveView.HTMLFormatter)
```

The `precommit` alias runs in the `:test` environment. Always run `mix precommit` before committing.

## Architecture

### Tech Stack
- **Elixir 1.17 / OTP 27** with **Phoenix 1.8.3** and **LiveView 1.1**
- **Ash Framework 3.0** for domain-driven resources, authentication (magic links + email/password), and admin UI
- **PostgreSQL** via Ash Postgres (NeonDB in production with PgBouncer)
- **Tailwind CSS v4** (config via `@import` syntax in `assets/css/app.css`, no `tailwind.config.js`)
- **DaisyUI** + **Mishka Chelekom** component libraries
- Deployed on **Fly.io** (Sydney region), auto-deploy from `main` via GitHub Actions

### Ash Framework

Resources and domains live in `lib/elixir_lizards/`, not the web layer. The repo (`ElixirLizards.Repo`) uses `AshPostgres.Repo` (not plain `Ecto.Repo`) with `citext` and `ash-functions` PostgreSQL extensions. Requires PostgreSQL 14.2+.

**Current domain:** `ElixirLizards.Accounts` with `User` and `Token` resources.

**Resource structure convention:**
```
lib/elixir_lizards/
├── accounts.ex                          # Ash Domain
└── accounts/
    ├── user.ex                          # Ash Resource
    ├── token.ex                         # Ash Resource
    └── user/senders/send_magic_link_email.ex
```

**Key Ash conventions in this project:**
- Define all schema, actions, and policies declaratively in resource files - avoid manual Ecto operations
- Use `Ash.Policy.Authorizer` on resources with bypass for `AshAuthentication.Checks.AshAuthenticationInteraction`
- Run `mix ash_postgres.generate_migrations` after changing resource definitions (not manual migrations)
- Secrets via `ElixirLizards.Secrets` module implementing `AshAuthentication.Secret`
- Authentication: magic link strategy with `AshAuthentication`, LiveView auth via `on_mount` hooks (`LiveUserAuth`)
- Formatter uses `Spark.Formatter` plugin with section ordering defined in `.formatter.exs`
- Ash Admin at `/admin` (dev only), enabled via `AshAdmin.Domain` extension on the domain

### Component Libraries
- **DaisyUI components** (`lib/elixir_lizards_web/components/daisyui/`) - auto-imported in `html_helpers` in `elixir_lizards_web.ex`, available in all templates
- **Chelekom components** (`lib/elixir_lizards_web/components/chelekom/`) - NOT auto-imported, must use full module name or explicit import
- Component demos at `lib/elixir_lizards_web/live/showcase/`

### Routing Structure
- `/` - Main app (PageController)
- `/demo/*` - DaisyUI showcase pages (dashboard, features, pricing, etc.)
- `/showcase/*` - Component demos (always available, even in prod)
- `/showcase/daisyui/*` - DaisyUI component demos
- `/showcase/chelekom` - Chelekom component demos
- `/auth/*` - Authentication routes (Ash Authentication)
- `/dev/*` - Dev tools: LiveDashboard, Swoosh mailbox (dev only)
- `/admin` - Ash Admin (dev only)
- `/health` - Health check (no auth, no SSL)

### Key Patterns
- LiveView-first architecture; avoid LiveComponents unless strongly needed
- LiveViews use `<Layouts.app flash={@flash}>` wrapper (Phoenix 1.8 pattern)
- `Layouts` is already aliased via `elixir_lizards_web.ex`
- Use streams for collections (never `phx-update="append"`)
- Colocated JS hooks with `:type={Phoenix.LiveView.ColocatedHook}` and `.` prefix names
- Module-level heredocs for code examples to avoid HEEx indentation issues
- Use `Req` for HTTP requests (already included), not HTTPoison/Tesla/httpc

## Chelekom Component Rules

Always read the component source file before writing demos. Component files are at `lib/elixir_lizards_web/components/chelekom/`.

- **Never** use self-closing slots (`<:slot_name />`); always use `<:slot_name>content</:slot_name>`
- Most input components require a `value` attribute (no default)
- When using `floating="outer"` or `floating="inner"`, the `label` attribute is required
- FormWrapper requires `for={%{}}` attribute
- NativeSelect: use `disabled="disabled"` not boolean `disabled`

## Elixir/Phoenix Gotchas

- HEEx uses `{...}` for attribute interpolation, `<%= %>` only for block constructs (if/for/cond) in tag bodies
- Class lists must use `[...]` syntax: `class={["base", @flag && "conditional"]}`
- No `when` guards in HEEx; use `&&` expressions for conditional classes
- No `else if`/`elsif` in Elixir; use `cond` or `case`
- Literal curly braces in HEEx need `phx-no-curly-interpolation` on parent tag
- Don't pipe JS commands into assigns; use `JS.exec` with data attributes
- Router `scope` aliases prefix all module references inside the scope
- `<.flash_group>` must only be called from `layouts.ex`
- Never nest multiple modules in the same file
- Don't use `String.to_atom/1` on user input
- Use `start_supervised!/1` in tests; avoid `Process.sleep/1`

## Tailwind CSS v4

Configuration lives in `assets/css/app.css` using the new import syntax:
```css
@import "tailwindcss" source(none);
@source "../css";
@source "../js";
@source "../../lib/elixir_lizards_web";
@plugin "../vendor/heroicons";
@plugin "../vendor/daisyui";
```

Never use `@apply`. Only `app.js` and `app.css` bundles are supported - vendor deps must be imported into these, no external script/link tags or inline `<script>` tags in templates.
