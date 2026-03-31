# ElixirLizards

To start your Phoenix server:

* Run `mix setup` to install and setup dependencies
* Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Component Libraries

This app ships two UI libraries:

- `DaisyUI` components under `lib/elixir_lizards_web/components/daisyui/`
- `Mishka Chelekom` components under `lib/elixir_lizards_web/components/chelekom/`

Browse the combined showcase at [`/showcase`](http://localhost:4000/showcase), with the Chelekom catalog at [`/showcase/chelekom`](http://localhost:4000/showcase/chelekom).

## Reference Standards

Use [`docs/REFERENCE_GUIDE.md`](docs/REFERENCE_GUIDE.md) as the source of truth for:

- the repo's reference surfaces
- dependency upgrade policy
- Chelekom integration constraints
- verification expectations

Contributor workflow lives in [`CONTRIBUTING.md`](CONTRIBUTING.md).
System design and layer boundaries are documented in [`ARCHITECTURE.md`](ARCHITECTURE.md).
The docs directory is indexed in [`docs/README.md`](docs/README.md).
Manual/browser QA baselines live in [`docs/REFERENCE_QA.md`](docs/REFERENCE_QA.md).
Refresh them with `mix reference.screenshots --base-url http://127.0.0.1:4100` while the app is running locally.

## Chelekom Workflow

Chelekom is installed as a development-only generator dependency. The generated component modules, CSS, and hook bundle are committed into this repo.

- Add or regenerate a component with `mix mishka.ui.gen.component component_name`
- Review current CSS generator settings with `mix mishka.ui.css.config --show`
- Regenerate the vendored Chelekom stylesheet after config changes with `mix mishka.ui.css.config --regenerate`

The current CSS generator config lives at `priv/mishka_chelekom/config.exs`, and the generated stylesheet lives at `assets/vendor/mishka_chelekom.css`.

Known limitation: the bulk generator task `mix mishka.ui.gen.components --yes` currently times out in `Owl.WidgetsRegistry` in this environment, so prefer targeted generation and committed vendored assets.

## Verification

Local verification:

- `mix deps.get`
- `mix precommit`
- `mix hex.outdated`

GitHub Actions mirrors that standard in `.github/workflows/ci.yml`.

## Learn more

* Official website: https://www.phoenixframework.org/
* Guides: https://hexdocs.pm/phoenix/overview.html
* Docs: https://hexdocs.pm/phoenix
* Forum: https://elixirforum.com/c/phoenix-forum
* Source: https://github.com/phoenixframework/phoenix
