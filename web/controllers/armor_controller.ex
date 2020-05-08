defmodule PathfoundPhoenixApi.ArmorController do
  use PathfoundPhoenixApi.Web, :controller

  alias PathfoundPhoenixApi.Armor

  def index(conn, _params) do
    armor = Repo.all(Armor)
    render(conn, "index.json", armor: armor)
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
