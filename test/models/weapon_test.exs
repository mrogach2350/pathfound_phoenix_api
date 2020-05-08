defmodule PathfoundPhoenixApi.WeaponTest do
  use PathfoundPhoenixApi.ModelCase

  alias PathfoundPhoenixApi.Weapon

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Weapon.changeset(%Weapon{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Weapon.changeset(%Weapon{}, @invalid_attrs)
    refute changeset.valid?
  end
end
