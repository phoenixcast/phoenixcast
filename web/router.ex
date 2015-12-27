defmodule Phoenixcast.Router do
  use Phoenixcast.Web, :router

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

  scope "/", Phoenixcast do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    resources "/videos", VideoController, only: [:index, :show]
  end

  scope "/admin", Phoenixcast.Admin, as: :admin do
    pipe_through :browser # Use the default browser stack

    resources "/videos", VideoController
  end

  # Other scopes may use custom stacks.
  # scope "/api", Phoenixcast do
  #   pipe_through :api
  # end
end
