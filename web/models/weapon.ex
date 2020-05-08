defmodule PathfoundPhoenixApi.Weapon do
  use PathfoundPhoenixApi.Web, :model

  schema "weapons" do
    field :critical, :string, default: ""
    field :damage_type, :string, default: ""
    field :description, :string, default: ""
    field :dmg_l, :string, default: ""
    field :dmg_m, :string, default: ""
    field :dmg_s, :string, default: ""
    field :dmg_t, :string, default: ""
    field :name, :string, default: ""
    field :price, :string, default: ""
    field :proficiency, :string, default: ""
    field :source, :string, default: ""
    field :special, :string, default: ""
    field :weapon_class, :string, default: ""
    field :weight, :string, default: ""

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [])
    |> validate_required([])
  end
end
