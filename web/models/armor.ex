defmodule PathfoundPhoenixApi.Armor do
  use PathfoundPhoenixApi.Web, :model

  schema "armor" do
    field :arcane_spell_failure, :string, default: ""
    field :armor_bonus, :string, default: ""
    field :armor_check_penalty, :string, default: ""
    field :armor_type, :string, default: ""
    field :description, :string, default: ""
    field :max_dex_bonus, :string, default: ""
    field :name, :string, default: ""
    field :price, :string, default: ""
    field :source, :string, default: ""
    field :speed_20_Ft, :string, default: ""
    field :speed_30_Ft, :string, default: ""
    field :weight, :string, default: ""

    timestamps()
  end

  @spec changeset(
          {map, map}
          | %{
              :__struct__ => atom,
              optional(:action) => :delete | :insert | nil | :replace | :update,
              optional(:changes) => %{optional(atom) => any},
              optional(:constraints) => [
                %{
                  constraint: binary,
                  field: atom,
                  match: :exact | :suffix,
                  message: {any, any},
                  type: :unique
                }
              ],
              optional(:data) => nil | %{__struct__: atom},
              optional(:empty_values) => any,
              optional(:errors) => [{atom, {any, any}}],
              optional(:filters) => %{optional(atom) => any},
              optional(:params) => nil | %{optional(binary) => any},
              optional(:prepare) => [(map -> map)],
              optional(:repo) => atom,
              optional(:required) => [atom],
              optional(:types) =>
                nil
                | %{
                    optional(atom) =>
                      atom | {:array, any} | {:embed, map} | {:in, any} | {:map, any}
                  },
              optional(:valid?) => boolean,
              optional(:validations) => keyword
            },
          :invalid | %{optional(:__struct__) => none, optional(atom | binary) => any}
        ) :: Ecto.Changeset.t()
  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [])
    |> validate_required([])
  end
end
