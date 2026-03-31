defmodule Mix.Tasks.Reference.Screenshots do
  use Mix.Task

  @shortdoc "Refreshes desktop and mobile reference screenshots with the browse CLI"

  @switches [
    base_url: :string,
    browse_bin: :string,
    output: :string,
    viewport: :string
  ]

  @aliases [b: :base_url, o: :output, v: :viewport]

  @impl Mix.Task
  def run(args) do
    {opts, positional, invalid} = OptionParser.parse(args, strict: @switches, aliases: @aliases)

    if positional != [] or invalid != [] do
      Mix.raise("""
      Invalid arguments.

      Usage:
        mix reference.screenshots
        mix reference.screenshots --base-url http://127.0.0.1:4100
        mix reference.screenshots --viewport mobile
        mix reference.screenshots --browse-bin /path/to/browse
      """)
    end

    base_url = opts[:base_url] || ElixirLizards.ReferenceScreenshots.default_base_url()
    output_root = opts[:output] || ElixirLizards.ReferenceScreenshots.default_output_root()
    browse_bin = opts[:browse_bin] || ElixirLizards.ReferenceScreenshots.browse_binary!()
    presets = parse_presets(opts[:viewport])

    Mix.shell().info("Refreshing reference screenshots from #{base_url}")
    Mix.shell().info("Output root: #{output_root}")
    Mix.shell().info("Viewports: #{Enum.join(presets, ", ")}")

    targets =
      ElixirLizards.ReferenceScreenshots.capture!(
        base_url: base_url,
        output_root: output_root,
        presets: presets,
        browse_bin: browse_bin
      )

    Mix.shell().info("Captured #{length(targets)} screenshots")
  end

  defp parse_presets(nil), do: ["desktop", "mobile"]
  defp parse_presets("all"), do: ["desktop", "mobile"]
  defp parse_presets(name) when name in ["desktop", "mobile"], do: [name]

  defp parse_presets(name) do
    Mix.raise("Unknown viewport #{inspect(name)}. Use desktop, mobile, or all.")
  end
end
