defmodule PathfoundPhoenixApi.ArmorTest do
  use PathfoundPhoenixApi.ModelCase

  alias PathfoundPhoenixApi.Armor

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Armor.changeset(%Armor{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Armor.changeset(%Armor{}, @invalid_attrs)
    refute changeset.valid?
  end
end
