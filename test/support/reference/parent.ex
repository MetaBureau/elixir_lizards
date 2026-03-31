defmodule ElixirLizards.Reference.Parent do
  use Ash.Resource,
    domain: ElixirLizards.Reference.BelongsToDomain,
    data_layer: Ash.DataLayer.Ets

  ets do
    private? true
  end

  actions do
    defaults [:read]

    create :create do
      primary? true
      accept [:name]
    end
  end

  attributes do
    uuid_primary_key :id

    attribute :name, :string do
      allow_nil? false
      public? true
    end
  end

  relationships do
    has_many :children, ElixirLizards.Reference.Child
  end
end
