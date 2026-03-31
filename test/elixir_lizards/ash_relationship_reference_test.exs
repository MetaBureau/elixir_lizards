defmodule ElixirLizards.AshRelationshipReferenceTest do
  use ExUnit.Case, async: true

  alias ElixirLizards.Reference.{Child, Parent}

  test "belongs_to writes work by accepting the foreign key directly" do
    parent = Ash.create!(Parent, %{name: "reference parent"})
    child = Ash.create!(Child, %{name: "reference child", parent_id: parent.id})

    assert child.parent_id == parent.id

    loaded_child = Ash.load!(child, :parent)

    assert loaded_child.parent.id == parent.id
    assert loaded_child.parent.name == "reference parent"
  end
end
