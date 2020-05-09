defmodule PathfoundPhoenixApi.WeaponsSeed do
  alias PathfoundPhoenixApi.Repo
  alias PathfoundPhoenixApi.Weapon

  def seed() do
    :pathfound_phoenix_api
    |> Application.app_dir("priv/repo/data/baseWeapons.json")
    |> File.read()
    |> case do
      {:ok, data} ->
        Jason.decode!(data)
        |> Enum.map(fn item ->
          IO.inspect(item)
          case item do
            %{
              "critical" => critical,
              "damageType" => damage_type,
              "description" => description,
              "dmgL" => dmg_l,
              "dmgM" => dmg_m,
              "dmgS" => dmg_s,
              "dmgT" => dmg_t,
              "name" => name,
              "price" => price,
              "proficiency" => proficiency,
              "source" => source,
              "special" => special,
              "weaponClass" => weapon_class,
              "weight" => weight
            } ->
              Repo.insert!(%Weapon{
                critical: critical,
                damage_type: damage_type,
                description: description,
                dmg_l: dmg_l,
                dmg_m: dmg_m,
                dmg_s: dmg_s,
                dmg_t: dmg_t,
                name: name,
                proficiency: proficiency,
                source: source,
                special: special,
                weapon_class: weapon_class,
                weight: weight,
                price: price
              })
            %{
              "critical" => critical,
              "description" => description,
              "dmgL" => dmg_l,
              "dmgM" => dmg_m,
              "dmgS" => dmg_s,
              "dmgT" => dmg_t,
              "name" => name,
              "price" => price,
              "proficiency" => proficiency,
              "source" => source,
              "special" => special,
              "weaponClass" => weapon_class,
              "weight" => weight
            } ->
              Repo.insert!(%Weapon{
                critical: critical,
                damage_type: nil,
                description: description,
                dmg_l: dmg_l,
                dmg_m: dmg_m,
                dmg_s: dmg_s,
                dmg_t: dmg_t,
                name: name,
                proficiency: proficiency,
                source: source,
                special: special,
                weapon_class: weapon_class,
                weight: weight,
                price: price
              })
              %{
                "critical" => critical,
                "damageType" => damage_type,
                "description" => description,
                "dmgL" => dmg_l,
                "dmgM" => dmg_m,
                "dmgS" => dmg_s,
                "dmgT" => dmg_t,
                "name" => name,
                "proficiency" => proficiency,
                "source" => source,
                "special" => special,
                "weaponClass" => weapon_class,
                "weight" => weight
              } ->
                Repo.insert!(%Weapon{
                  critical: critical,
                  damage_type: damage_type,
                  description: description,
                  dmg_l: dmg_l,
                  dmg_m: dmg_m,
                  dmg_s: dmg_s,
                  dmg_t: dmg_t,
                  name: name,
                  proficiency: proficiency,
                  source: source,
                  special: special,
                  weapon_class: weapon_class,
                  weight: weight,
                  price: ""
                })
          end
        end)
    end
  end
end
