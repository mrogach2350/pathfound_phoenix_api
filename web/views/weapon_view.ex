defmodule PathfoundPhoenixApi.WeaponView do
  use PathfoundPhoenixApi.Web, :view

  def render("index.json", %{weapons: weapons}) do
    %{data: render_many(weapons, PathfoundPhoenixApi.WeaponView, "weapon.json")}
  end

  def render("show.json", %{weapon: weapon}) do
    %{data: render_one(weapon, PathfoundPhoenixApi.WeaponView, "weapon.json")}
  end

  def render("weapon.json", %{weapon: weapon}) do
    %{
      id: weapon.id,
      critical: weapon.critical,
      damage_type: weapon.damage_type,
      description: weapon.description,
      dmg_l: weapon.dmg_l,
      dmg_m: weapon.dmg_m,
      dmg_s: weapon.dmg_s,
      dmg_t: weapon.dmg_t,
      name: weapon.name,
      proficiency: weapon.proficiency,
      source: weapon.source,
      special: weapon.special,
      weapon_class: weapon.weapon_class,
      weight: weapon.weight,
      price: weapon.price
    }
  end
end
