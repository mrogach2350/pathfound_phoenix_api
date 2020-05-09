defmodule PathfoundPhoenixApi.ArmorSeed do
  alias PathfoundPhoenixApi.Armor
  alias PathfoundPhoenixApi.Repo

  def seed() do
    :pathfound_phoenix_api
    |> Application.app_dir("priv/repo/data/baseArmor.json")
    |> File.read()
    |> case do
      {:ok, data} ->
        Jason.decode!(data)
        |> Enum.map(fn item ->
          case item do
            %{
              "arcaneSpellFailure" => arcane_spell_failure,
              "armorBonus" => armor_bonus,
              "armorCheckPenalty" => armor_check_penalty,
              "armorType" => armor_type,
              "description" => description,
              "maxDexBonus" => max_dex_bonus,
              "name" => name,
              "price" => price,
              "source" => source,
              "speed20Ft" => speed_20_Ft,
              "speed30fFt" => speed_30_Ft,
              "weight" => weight
            } ->
              Repo.insert!(%Armor{
                arcane_spell_failure: arcane_spell_failure,
                armor_bonus: armor_bonus,
                armor_check_penalty: armor_check_penalty,
                armor_type: armor_type,
                description: description,
                max_dex_bonus: max_dex_bonus,
                name: name,
                price: price,
                source: source,
                speed_20_Ft: speed_20_Ft,
                speed_30_Ft: speed_30_Ft,
                weight: weight
              })

            %{
              "arcaneSpellFailure" => arcane_spell_failure,
              "armorCheckPenalty" => armor_check_penalty,
              "armorType" => armor_type,
              "description" => description,
              "maxDexBonus" => max_dex_bonus,
              "name" => name,
              "price" => price,
              "source" => source,
              "speed20Ft" => speed_20_Ft,
              "speed30fFt" => speed_30_Ft,
              "weight" => weight
            } ->
              Repo.insert!(%Armor{
                arcane_spell_failure: arcane_spell_failure,
                armor_bonus: "",
                armor_check_penalty: armor_check_penalty,
                armor_type: armor_type,
                description: description,
                max_dex_bonus: max_dex_bonus,
                name: name,
                price: price,
                source: source,
                speed_20_Ft: speed_20_Ft,
                speed_30_Ft: speed_30_Ft,
                weight: weight
              })

            %{
              "armorType" => armor_type,
              "description" => description,
              "name" => name,
              "price" => price,
              "source" => source,
              "speed20Ft" => speed_20_Ft,
              "speed30fFt" => speed_30_Ft,
              "weight" => weight
            } ->
              Repo.insert!(%Armor{
                arcane_spell_failure: "",
                armor_bonus: "",
                armor_check_penalty: "",
                armor_type: armor_type,
                description: description,
                max_dex_bonus: "",
                name: name,
                price: price,
                source: source,
                speed_20_Ft: speed_20_Ft,
                speed_30_Ft: speed_30_Ft,
                weight: weight
              })
          end
        end)
    end
  end
end
