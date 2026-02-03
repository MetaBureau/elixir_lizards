defmodule ElixirLizardsWeb.Demo.MapboxLive do
  @moduledoc """
  Demo page showcasing Mapbox GL JS integration with Phoenix LiveView.
  Demonstrates map initialization, markers, and server-pushed events.
  """
  use ElixirLizardsWeb, :live_view

  @default_lat 40.7128
  @default_lng -74.0060
  @default_zoom 12

  @impl true
  def mount(_params, _session, socket) do
    mapbox_token = Application.get_env(:elixir_lizards, :mapbox_access_token)

    {:ok,
     socket
     |> assign(:page_title, "Mapbox Demo")
     |> assign(:mapbox_token, mapbox_token)
     |> assign(:lat, @default_lat)
     |> assign(:lng, @default_lng)
     |> assign(:zoom, @default_zoom)
     |> assign(:locations, sample_locations())
     |> assign(:selected_location, nil)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <Layouts.app flash={@flash}>
      <.breadcrumb>
        <:crumb navigate={~p"/"}>Home</:crumb>
        <:crumb navigate={~p"/demo"}>Demo</:crumb>
        <:crumb>Mapbox</:crumb>
      </.breadcrumb>

      <.header>
        Mapbox Integration
        <:subtitle>Interactive maps with Mapbox GL JS and Phoenix LiveView</:subtitle>
      </.header>

      <div class="grid grid-cols-1 lg:grid-cols-4 gap-6">
        <%!-- Map Container --%>
        <div class="lg:col-span-3">
          <.card variant="bordered">
            <:body>
              <%= if @mapbox_token do %>
                <div
                  id="mapbox-container"
                  phx-hook=".MapboxMap"
                  phx-update="ignore"
                  data-access-token={@mapbox_token}
                  data-lat={@lat}
                  data-lng={@lng}
                  data-zoom={@zoom}
                  class="h-[500px] w-full rounded-lg"
                >
                </div>
              <% else %>
                <div class="h-[500px] w-full rounded-lg bg-base-200 flex items-center justify-center">
                  <div class="text-center p-8">
                    <.icon name="hero-map" class="size-16 text-base-content/30 mx-auto mb-4" />
                    <h3 class="text-lg font-semibold mb-2">Mapbox Token Required</h3>
                    <p class="text-base-content/70 mb-4">
                      Set the <code class="bg-base-300 px-2 py-1 rounded">MAPBOX_ACCESS_TOKEN</code>
                      environment variable to enable the map.
                    </p>
                    <p class="text-sm text-base-content/50">
                      Get your token at
                      <a
                        href="https://account.mapbox.com"
                        target="_blank"
                        class="link link-primary"
                      >
                        account.mapbox.com
                      </a>
                    </p>
                  </div>
                </div>
              <% end %>
            </:body>
          </.card>
        </div>

        <%!-- Location Controls --%>
        <div class="lg:col-span-1">
          <.card variant="bordered">
            <:title>
              <div class="flex items-center gap-2">
                <.icon name="hero-map-pin" class="size-5" /> Locations
              </div>
            </:title>
            <:body>
              <div class="space-y-2">
                <button
                  :for={location <- @locations}
                  phx-click="fly_to"
                  phx-value-id={location.id}
                  class={[
                    "w-full text-left p-3 rounded-lg transition-colors",
                    "hover:bg-base-200",
                    @selected_location == location.id && "bg-primary/10 border border-primary"
                  ]}
                >
                  <div class="font-medium">{location.name}</div>
                  <div class="text-sm text-base-content/70">{location.description}</div>
                </button>
              </div>
            </:body>
          </.card>

          <.card variant="bordered" class="mt-4">
            <:title>
              <div class="flex items-center gap-2">
                <.icon name="hero-cursor-arrow-rays" class="size-5" /> Actions
              </div>
            </:title>
            <:body>
              <div class="space-y-2">
                <.button class="w-full" phx-click="add_markers">
                  <.icon name="hero-map-pin" class="size-4 mr-2" /> Show All Markers
                </.button>
                <.button class="w-full" phx-click="clear_markers">
                  <.icon name="hero-trash" class="size-4 mr-2" /> Clear Markers
                </.button>
                <.button class="w-full" phx-click="reset_view">
                  <.icon name="hero-arrow-path" class="size-4 mr-2" /> Reset View
                </.button>
              </div>
            </:body>
          </.card>
        </div>
      </div>

      <%!-- Colocated Mapbox Hook --%>
      <script :type={Phoenix.LiveView.ColocatedHook} name=".MapboxMap">
        export default {
          mounted() {
            // Initialize Mapbox
            mapboxgl.accessToken = this.el.dataset.accessToken;

            this.map = new mapboxgl.Map({
              container: this.el,
              style: 'mapbox://styles/mapbox/streets-v12',
              center: [
                parseFloat(this.el.dataset.lng),
                parseFloat(this.el.dataset.lat)
              ],
              zoom: parseFloat(this.el.dataset.zoom)
            });

            // Add navigation controls
            this.map.addControl(new mapboxgl.NavigationControl());

            // Store markers for cleanup
            this.markers = [];

            // Handle server events
            this.handleEvent("fly_to", ({lng, lat, zoom}) => {
              this.map.flyTo({
                center: [lng, lat],
                zoom: zoom || 14,
                essential: true
              });
            });

            this.handleEvent("add_markers", ({markers}) => {
              // Clear existing markers
              this.markers.forEach(m => m.remove());
              this.markers = [];

              // Add new markers
              markers.forEach(m => {
                const marker = new mapboxgl.Marker({color: m.color || '#3b82f6'})
                  .setLngLat([m.lng, m.lat])
                  .setPopup(new mapboxgl.Popup().setHTML(`<strong>${m.name}</strong><p>${m.description || ''}</p>`))
                  .addTo(this.map);
                this.markers.push(marker);
              });
            });

            this.handleEvent("clear_markers", () => {
              this.markers.forEach(m => m.remove());
              this.markers = [];
            });

            this.handleEvent("reset_view", ({lng, lat, zoom}) => {
              this.map.flyTo({
                center: [lng, lat],
                zoom: zoom,
                essential: true
              });
            });
          },

          destroyed() {
            if (this.map) {
              this.markers.forEach(m => m.remove());
              this.map.remove();
            }
          }
        }
      </script>
    </Layouts.app>
    """
  end

  @impl true
  def handle_event("fly_to", %{"id" => id}, socket) do
    location = Enum.find(socket.assigns.locations, &(&1.id == id))

    if location do
      {:noreply,
       socket
       |> assign(:selected_location, id)
       |> push_event("fly_to", %{lng: location.lng, lat: location.lat, zoom: 14})}
    else
      {:noreply, socket}
    end
  end

  def handle_event("add_markers", _params, socket) do
    markers =
      Enum.map(socket.assigns.locations, fn loc ->
        %{
          name: loc.name,
          description: loc.description,
          lng: loc.lng,
          lat: loc.lat,
          color: loc.color
        }
      end)

    {:noreply, push_event(socket, "add_markers", %{markers: markers})}
  end

  def handle_event("clear_markers", _params, socket) do
    {:noreply,
     socket
     |> assign(:selected_location, nil)
     |> push_event("clear_markers", %{})}
  end

  def handle_event("reset_view", _params, socket) do
    {:noreply,
     socket
     |> assign(:selected_location, nil)
     |> push_event("reset_view", %{
       lng: @default_lng,
       lat: @default_lat,
       zoom: @default_zoom
     })}
  end

  defp sample_locations do
    [
      %{
        id: "nyc",
        name: "New York City",
        description: "The Big Apple",
        lat: 40.7128,
        lng: -74.0060,
        color: "#ef4444"
      },
      %{
        id: "sf",
        name: "San Francisco",
        description: "Golden Gate City",
        lat: 37.7749,
        lng: -122.4194,
        color: "#f97316"
      },
      %{
        id: "london",
        name: "London",
        description: "United Kingdom",
        lat: 51.5074,
        lng: -0.1278,
        color: "#8b5cf6"
      },
      %{
        id: "tokyo",
        name: "Tokyo",
        description: "Japan",
        lat: 35.6762,
        lng: 139.6503,
        color: "#ec4899"
      },
      %{
        id: "sydney",
        name: "Sydney",
        description: "Australia",
        lat: -33.8688,
        lng: 151.2093,
        color: "#14b8a6"
      }
    ]
  end
end
