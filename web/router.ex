defmodule ImHere.Router do
  use Phoenix.Router

  pipeline :browser do
    plug :accepts, ~w(html)
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ~w(json)
  end

  scope "/", ImHere do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/api", ImHere.Api do
    pipe_through :api

    get "/rooms", RoomsController, :listRooms
    get "/near", RoomsController, :near
  end
end
