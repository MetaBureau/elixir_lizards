defmodule ElixirLizards.Reference.Child do
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
      accept [:name, :parent_id]
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
    belongs_to :parent, ElixirLizards.Reference.Parent do
      allow_nil? false
      attribute_public? true
    end
  end
end
