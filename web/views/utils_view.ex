defmodule PathfoundPhoenixApi.UtilsView do
  use PathfoundPhoenixApi.Web, :view

  def render("count.json", %{count: count}) do
    %{data: %{count: count}}
  end
end
