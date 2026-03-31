# Contributing

This repo is maintained as a practical Phoenix + Ash + LiveView reference app. Changes should improve the codebase and also preserve its value as an example.

## Setup

1. Run `mix setup`
2. Start the app with `mix phx.server`
3. Visit:
   - `http://localhost:4000/`
   - `http://localhost:4000/showcase`
   - `http://localhost:4000/demo`

## Required Checks

Run these before considering work complete:

```sh
mix deps.get
mix precommit
mix hex.outdated
```

CI mirrors this policy:

- push and pull request runs execute `mix precommit`
- scheduled and manual runs execute `mix hex.outdated`

## Testing Expectations

- Add or preserve stable DOM ids on LiveView pages when they are useful for tests.
- Prefer `Phoenix.LiveViewTest` smoke coverage for public routes.
- Prefer focused assertions over full HTML snapshots.
- If a page is interactive, test one representative interaction.

## UI and Component Expectations

- Keep the DaisyUI and Chelekom showcase surfaces working.
- Use `/dev/components`, `/showcase`, and `/demo` as manual QA surfaces.
- Preserve Phoenix 1.8 conventions such as wrapping pages in `<Layouts.app flash={@flash}>`.

## Ash and Data Modeling Expectations

- Prefer executable examples in docs over pseudocode.
- Model `belongs_to` writes via foreign keys like `content_id` and `run_id`.
- Do not document or introduce `manage_relationship(..., type: :append)` for `belongs_to`.

## Dependency Policy

- Keep `mix.exs` version requirements aligned with the supported lockfile series.
- Treat Ash, AshPostgres, Phoenix, and LiveView upgrades as behavior-sensitive.
- Re-run the full verification suite after dependency updates.

## Chelekom Notes

- `mishka_chelekom` is a dev-only generator dependency.
- Generated modules and vendored assets are committed to the repo.
- In this environment, `mix mishka.ui.gen.components --yes` currently times out in `Owl.WidgetsRegistry`.
- Prefer targeted generation and committed vendored assets over assuming bulk regeneration is safe.
