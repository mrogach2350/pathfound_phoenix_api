defmodule PathfoundPhoenixApi.WeaponController do
  use PathfoundPhoenixApi.Web, :controller

  alias PathfoundPhoenixApi.Weapon

  def index(conn, _params) do
    weapons = Repo.all(Weapon)
    render(conn, "index.json", weapons: weapons)
  end

  def create(conn, %{"weapon" => weapon_params}) do
    changeset = Weapon.changeset(%Weapon{}, weapon_params)

    case Repo.insert(changeset) do
      {:ok, weapon} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", weapon_path(conn, :show, weapon))
        |> render("show.json", weapon: weapon)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(PathfoundPhoenixApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    weapon = Repo.get!(Weapon, id)
    render(conn, "show.json", weapon: weapon)
  end

  def update(conn, %{"id" => id, "weapon" => weapon_params}) do
    weapon = Repo.get!(Weapon, id)
    changeset = Weapon.changeset(weapon, weapon_params)

    case Repo.update(changeset) do
      {:ok, weapon} ->
        render(conn, "show.json", weapon: weapon)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(PathfoundPhoenixApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    weapon = Repo.get!(Weapon, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(weapon)

    send_resp(conn, :no_content, "")
  end
end
