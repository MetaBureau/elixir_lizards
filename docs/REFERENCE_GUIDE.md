# Reference Guide

This repo is intended to be a practical Phoenix 1.8 + Ash + LiveView reference app, not just a demo.

## What This Repo Demonstrates

- Phoenix 1.8 LiveView application structure
- Ash domains, authentication, and Postgres integration
- Two parallel UI libraries:
  - DaisyUI-first app components
  - Mishka Chelekom generated components and showcase pages
- Dev-only operational tooling:
  - AshAdmin at `/admin`
  - LiveDashboard at `/dev/dashboard`
  - Swoosh mailbox preview at `/dev/mailbox`

## Reference Routes

- `/` main landing page
- `/showcase` component library index
- `/showcase/daisyui` DaisyUI catalog
- `/showcase/chelekom` Chelekom catalog
- `/admin` AshAdmin, enabled when `:dev_routes` is on
- `/dev/dashboard` LiveDashboard, enabled when `:dev_routes` is on

## Dependency Policy

- Keep the lockfile current with `mix deps.update --all` and verify with `mix hex.outdated`.
- Tighten `mix.exs` requirements to the currently supported series after large dependency refreshes.
- Treat Ash, AshPostgres, Phoenix, and LiveView upgrades as behavior-sensitive changes and run the full verification suite after updates.

## Chelekom Policy

- Chelekom is a dev-only generator dependency.
- Generated component modules, CSS, and JS hooks are committed into the repo.
- The bulk generator task currently has a known issue in this environment:
  - `mix mishka.ui.gen.components --yes` times out in `Owl.WidgetsRegistry`
- Use targeted generation and committed vendored assets instead of assuming full regeneration is safe.

## Documentation Policy

- Docs should prefer executable, copy-pasteable examples over pseudocode when possible.
- Ash resource examples should model `belongs_to` writes via foreign keys such as `content_id` and `run_id`.
- Do not show `manage_relationship(..., type: :append)` for `belongs_to`.

## Verification Standard

Run this before calling the repo healthy after changes:

```sh
mix deps.get
mix precommit
mix hex.outdated
```

When a UI change affects a reference surface, also refresh the visual baselines:

```sh
PORT=4100 mix phx.server
mix reference.screenshots --base-url http://127.0.0.1:4100
```

CI mirrors this standard:

- pull requests and pushes run `mix precommit`
- scheduled/manual runs execute `mix hex.outdated`

## Test Standard

- Keep stable DOM ids on showcase pages so LiveView tests do not depend on brittle text.
- Add route-level or LiveView smoke tests for public demo surfaces.
- Prefer testing component catalogs by IDs and counts instead of long text snapshots.
- Keep the screenshot refresh path reproducible through repo-native commands instead of ad hoc shell snippets.
