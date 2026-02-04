defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.DropdownDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.{Button, Dropdown}

  def render(assigns) do
    ~H"""
    <div class="space-y-6">
      <div class="text-center">
        <h2 class="text-3xl font-bold mb-2">Dropdown</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Expandable menus for actions and navigation options
        </p>
      </div>

      <div class="flex flex-wrap gap-6 justify-center">
        <Dropdown.dropdown id="chelekom-dropdown-1" position="bottom" clickable rounded="medium">
          <:trigger>
            <Button.button>
              Click Me <.icon name="hero-chevron-down" class="size-4 ml-1" />
            </Button.button>
          </:trigger>
          <:content>
            <div class="py-1 min-w-32">
              <div class="px-3 py-2 hover:bg-base-200 cursor-pointer">Dashboard</div>
              <div class="px-3 py-2 hover:bg-base-200 cursor-pointer">Settings</div>
              <div class="px-3 py-2 hover:bg-base-200 cursor-pointer">Profile</div>
              <div class="px-3 py-2 hover:bg-base-200 cursor-pointer text-error">Sign Out</div>
            </div>
          </:content>
        </Dropdown.dropdown>

        <Dropdown.dropdown id="chelekom-dropdown-2" position="bottom" clickable rounded="medium">
          <:trigger>
            <Button.button variant="outline">
              Options <.icon name="hero-chevron-down" class="size-4 ml-1" />
            </Button.button>
          </:trigger>
          <:content>
            <div class="py-1 min-w-32">
              <div class="px-3 py-2 hover:bg-base-200 cursor-pointer">Edit</div>
              <div class="px-3 py-2 hover:bg-base-200 cursor-pointer">Duplicate</div>
              <div class="px-3 py-2 hover:bg-base-200 cursor-pointer">Archive</div>
            </div>
          </:content>
        </Dropdown.dropdown>
      </div>
    </div>
    """
  end
end
