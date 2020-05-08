defmodule PathfoundPhoenixApi.PageController do
  use PathfoundPhoenixApi.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
