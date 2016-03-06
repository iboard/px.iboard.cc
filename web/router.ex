defmodule Iboard.Router do
  use Iboard.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Pjax.Plugs.Pjax
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Iboard do
    pipe_through :browser # Use the default browser stack

    resources "/pages", PageController

    get "/", PageController, :index
    get "/md/:filename", PageController, :md
  end

  # Other scopes may use custom stacks.
  # scope "/api", Iboard do
  #   pipe_through :api
  # end
end
