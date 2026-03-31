defmodule ElixirLizards.ReferenceScreenshots do
  @moduledoc false

  @default_base_url "http://127.0.0.1:4100"
  @default_output_root "docs/reference-images"

  @surfaces [
    %{file: "home.png", path: "/"},
    %{file: "demo-home.png", path: "/demo"},
    %{file: "showcase-index.png", path: "/showcase"},
    %{file: "showcase-daisyui.png", path: "/showcase/daisyui"},
    %{file: "showcase-chelekom.png", path: "/showcase/chelekom"},
    %{file: "dev-dashboard.png", path: "/dev/dashboard/home"},
    %{file: "dev-mailbox.png", path: "/dev/mailbox"},
    %{file: "admin.png", path: "/admin"}
  ]

  @presets %{
    "desktop" => %{height: 1200, subdir: "desktop", width: 1440},
    "mobile" => %{height: 844, subdir: "mobile", width: 390}
  }

  def default_base_url, do: @default_base_url

  def default_output_root, do: @default_output_root

  def presets, do: @presets

  def surfaces, do: @surfaces

  def browse_binary! do
    candidates = [
      System.get_env("BROWSE_BIN"),
      Path.join([System.user_home!(), ".codex", "skills", "gstack", "browse", "dist", "browse"]),
      System.find_executable("browse")
    ]

    Enum.find(candidates, &browse_binary?/1) ||
      Mix.raise(
        "Could not find the browse binary. Set BROWSE_BIN or install the gstack browse tool."
      )
  end

  def capture_targets(opts \\ []) do
    base_url = Keyword.get(opts, :base_url, @default_base_url)
    output_root = Keyword.get(opts, :output_root, @default_output_root)
    preset_names = Keyword.get(opts, :presets, Map.keys(@presets))

    for preset_name <- preset_names,
        preset = Map.fetch!(@presets, preset_name),
        surface <- @surfaces do
      %{
        output_path: Path.join([output_root, preset.subdir, surface.file]),
        path: surface.path,
        preset: preset_name,
        url: build_url(base_url, surface.path),
        viewport: "#{preset.width}x#{preset.height}"
      }
    end
  end

  def capture!(opts \\ []) do
    browse_bin = Keyword.get(opts, :browse_bin, browse_binary!())
    targets = capture_targets(opts)

    targets
    |> Enum.group_by(& &1.preset)
    |> Enum.each(fn {_preset_name, preset_targets} ->
      preset_targets
      |> List.first()
      |> Map.fetch!(:viewport)
      |> then(fn viewport -> run!(browse_bin, ["viewport", viewport]) end)

      Enum.each(preset_targets, fn target ->
        File.mkdir_p!(Path.dirname(target.output_path))
        run!(browse_bin, ["goto", target.url])
        run!(browse_bin, ["wait", "--load"])
        run!(browse_bin, ["screenshot", "--viewport", target.output_path])
      end)
    end)

    targets
  end

  defp browse_binary?(nil), do: false
  defp browse_binary?(path), do: File.regular?(path)

  defp build_url(base_url, "/"), do: String.trim_trailing(base_url, "/") <> "/"

  defp build_url(base_url, path) do
    String.trim_trailing(base_url, "/") <> path
  end

  defp run!(browse_bin, args) do
    case System.cmd(browse_bin, args, stderr_to_stdout: true) do
      {output, 0} ->
        output

      {output, status} ->
        Mix.raise("""
        browse command failed with status #{status}
        command: #{Enum.join([browse_bin | args], " ")}
        output:
        #{output}
        """)
    end
  end
end
