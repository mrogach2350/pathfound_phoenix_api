defmodule PathfoundPhoenixApi.Router do
  use PathfoundPhoenixApi.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PathfoundPhoenixApi do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/armor", ArmorController, except: [:new, :edit]
    resources "/weapons", WeaponController, except: [:new, :edit]
  end

  # Other scopes may use custom stacks.
  # scope "/api", PathfoundPhoenixApi do
  #   pipe_through :api
  # end
end