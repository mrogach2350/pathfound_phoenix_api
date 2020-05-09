defmodule PathfoundPhoenixApi.ArmorController do
  use PathfoundPhoenixApi.Web, :controller

  alias PathfoundPhoenixApi.Armor
  alias PathfoundPhoenixApi.UtilsView
  alias PathfoundPhoenixApi.ErrorView

  def index(conn, %{ "ps" => page_size, "pn" => page_number }) do
    case {page_size, page_number} do
      {_, ""} ->
        render(conn, ErrorView, "error.json", error: "page number is missing")

      {"", _} ->
        render(conn, ErrorView, "error.json", error: "page size is missing")

      {page_size, page_number} ->
        ps = String.to_integer(page_size)
        pn = String.to_integer(page_number) - 1

        armor = Armor
          |> Repo.all
          |> Enum.slice(pn * ps, ps)
        render(conn, "index.json", armor: armor)
    end
  end

  def index(conn, _params) do
    count = Armor
          |> Repo.all
          |> Enum.count
        render(conn, UtilsView, "count.json", count: count)
  end

  def create(conn, %{"armor" => armor_params}) do
    changeset = Armor.changeset(%Armor{}, armor_params)

    case Repo.insert(changeset) do
      {:ok, armor} ->
        conn
        |> put_status(:created)
        |> render("show.json", armor: armor)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(PathfoundPhoenixApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    armor = Repo.get!(Armor, id)
    render(conn, "show.json", armor: armor)
  end

  def update(conn, %{"id" => id, "armor" => armor_params}) do
    armor = Repo.get!(Armor, id)
    changeset = Armor.changeset(armor, armor_params)

    case Repo.update(changeset) do
      {:ok, armor} ->
        render(conn, "show.json", armor: armor)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(PathfoundPhoenixApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    armor = Repo.get!(Armor, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(armor)

    send_resp(conn, :no_content, "")
  end
end
