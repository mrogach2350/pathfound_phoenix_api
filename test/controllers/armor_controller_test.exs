defmodule PathfoundPhoenixApi.ArmorControllerTest do
  use PathfoundPhoenixApi.ConnCase

  alias PathfoundPhoenixApi.Armor
  @valid_attrs %{}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, armor_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    armor = Repo.insert! %Armor{}
    conn = get conn, armor_path(conn, :show, armor)
    assert json_response(conn, 200)["data"] == %{"id" => armor.id}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, armor_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, armor_path(conn, :create), armor: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Armor, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, armor_path(conn, :create), armor: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    armor = Repo.insert! %Armor{}
    conn = put conn, armor_path(conn, :update, armor), armor: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Armor, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    armor = Repo.insert! %Armor{}
    conn = put conn, armor_path(conn, :update, armor), armor: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    armor = Repo.insert! %Armor{}
    conn = delete conn, armor_path(conn, :delete, armor)
    assert response(conn, 204)
    refute Repo.get(Armor, armor.id)
  end
end
