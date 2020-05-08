defmodule PathfoundPhoenixApi.Repo.Migrations.CreateArmor do
  use Ecto.Migration

  def change do
    create table(:armor) do
      add :arcane_spell_failure, :string
      add :armor_bonus, :string
      add :armor_check_penalty, :string
      add :armor_type, :string
      add :description, :text
      add :max_dex_bonus, :string
      add :name, :string
      add :price, :string
      add :source, :string
      add :speed_20_Ft, :string
      add :speed_30_Ft, :string
      add :weight, :string

      timestamps()
    end

  end
end
