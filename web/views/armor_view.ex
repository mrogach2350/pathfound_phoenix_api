defmodule PathfoundPhoenixApi.ArmorView do
  use PathfoundPhoenixApi.Web, :view

  def render("index.json", %{armor: armor}) do
    %{data: render_many(armor, PathfoundPhoenixApi.ArmorView, "armor.json")}
  end

  def render("show.json", %{armor: armor}) do
    %{data: render_one(armor, PathfoundPhoenixApi.ArmorView, "armor.json")}
  end

  def render("armor.json", %{armor: armor}) do
    %{
      id: armor.id,
      arcane_spell_failure: armor.arcane_spell_failure,
      armor_bonus: armor.armor_bonus,
      armor_check_penalty: armor.armor_check_penalty,
      armor_type: armor.armor_type,
      description: armor.description,
      max_dex_bonus: armor.max_dex_bonus,
      name: armor.name,
      price: armor.price,
      source: armor.source,
      speed_20_Ft: armor.speed_20_Ft,
      speed_30_Ft: armor.speed_30_Ft,
      weight: armor.weight
    }
  end
end
