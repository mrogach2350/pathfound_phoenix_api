defmodule PathfoundPhoenixApi.WeaponView do
  use PathfoundPhoenixApi.Web, :view

  def render("index.json", %{weapons: weapons}) do
    %{data: render_many(weapons, PathfoundPhoenixApi.WeaponView, "weapon.json")}
  end

  def render("show.json", %{weapon: weapon}) do
    %{data: render_one(weapon, PathfoundPhoenixApi.WeaponView, "weapon.json")}
  end

  def render("weapon.json", %{weapon: weapon}) do
    %{id: weapon.id}
  end
end
