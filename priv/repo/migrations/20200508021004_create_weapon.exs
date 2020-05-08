defmodule PathfoundPhoenixApi.Repo.Migrations.CreateWeapon do
  use Ecto.Migration

  def change do
    create table(:weapons) do
      add :critical, :string
      add :damage_type, :string
      add :description, :text
      add :dmg_l, :string
      add :dmg_m, :string
      add :dmg_s, :string
      add :dmg_t, :string
      add :name, :string
      add :price, :string
      add :proficiency, :string
      add :source, :string
      add :special, :string
      add :weapon_class, :string
      add :weight, :string

      timestamps()
    end

  end
end
