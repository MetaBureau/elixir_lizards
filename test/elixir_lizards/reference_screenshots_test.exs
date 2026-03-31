defmodule ElixirLizards.ReferenceScreenshotsTest do
  use ExUnit.Case, async: true

  alias ElixirLizards.ReferenceScreenshots

  test "defines desktop and mobile presets" do
    assert %{
             "desktop" => %{height: 1200, subdir: "desktop", width: 1440},
             "mobile" => %{height: 844, subdir: "mobile", width: 390}
           } = ReferenceScreenshots.presets()
  end

  test "builds capture targets for each route and preset" do
    targets =
      ReferenceScreenshots.capture_targets(
        base_url: "http://127.0.0.1:9999",
        output_root: "tmp/reference-images",
        presets: ["desktop", "mobile"]
      )

    assert length(targets) == 16

    assert %{
             output_path: "tmp/reference-images/desktop/home.png",
             path: "/",
             preset: "desktop",
             url: "http://127.0.0.1:9999/",
             viewport: "1440x1200"
           } in targets

    assert %{
             output_path: "tmp/reference-images/mobile/admin.png",
             path: "/admin",
             preset: "mobile",
             url: "http://127.0.0.1:9999/admin",
             viewport: "390x844"
           } in targets
  end
end
