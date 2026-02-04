defmodule ElixirLizardsWeb.Showcase.Chelekom.Categories.Forms do
  @moduledoc """
  Form components: CheckboxCard, CheckboxField, ColorField, Combobox, DateTimeField, EmailField,
  Fieldset, FileField, FormWrapper, InputField, NativeSelect, NumberField, PasswordField,
  RadioCard, RadioField, RangeField, SearchField, TelField, TextField, TextareaField,
  ToggleField, UrlField
  """
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Showcase.Chelekom.Components.{
    CheckboxCardDemo,
    CheckboxFieldDemo,
    ColorFieldDemo,
    ComboboxDemo,
    DateTimeFieldDemo,
    EmailFieldDemo,
    FieldsetDemo,
    FileFieldDemo,
    FormWrapperDemo,
    InputFieldDemo,
    NativeSelectDemo,
    NumberFieldDemo,
    PasswordFieldDemo,
    RadioCardDemo,
    RadioFieldDemo,
    RangeFieldDemo,
    SearchFieldDemo,
    TelFieldDemo,
    TextFieldDemo,
    TextareaFieldDemo,
    ToggleFieldDemo,
    UrlFieldDemo
  }

  @components [
    %{name: "CheckboxCard", module: CheckboxCardDemo},
    %{name: "CheckboxField", module: CheckboxFieldDemo},
    %{name: "ColorField", module: ColorFieldDemo},
    %{name: "Combobox", module: ComboboxDemo},
    %{name: "DateTimeField", module: DateTimeFieldDemo},
    %{name: "EmailField", module: EmailFieldDemo},
    %{name: "Fieldset", module: FieldsetDemo},
    %{name: "FileField", module: FileFieldDemo},
    %{name: "FormWrapper", module: FormWrapperDemo},
    %{name: "InputField", module: InputFieldDemo},
    %{name: "NativeSelect", module: NativeSelectDemo},
    %{name: "NumberField", module: NumberFieldDemo},
    %{name: "PasswordField", module: PasswordFieldDemo},
    %{name: "RadioCard", module: RadioCardDemo},
    %{name: "RadioField", module: RadioFieldDemo},
    %{name: "RangeField", module: RangeFieldDemo},
    %{name: "SearchField", module: SearchFieldDemo},
    %{name: "TelField", module: TelFieldDemo},
    %{name: "TextField", module: TextFieldDemo},
    %{name: "TextareaField", module: TextareaFieldDemo},
    %{name: "ToggleField", module: ToggleFieldDemo},
    %{name: "UrlField", module: UrlFieldDemo}
  ]

  def components, do: @components

  def render(assigns) do
    assigns = assign(assigns, :components, @components)

    ~H"""
    <div class="space-y-16">
      <section :for={component <- @components}>
        <.live_component
          module={component.module}
          id={"#{String.downcase(component.name)}-demo"}
        />
      </section>
    </div>
    """
  end
end
