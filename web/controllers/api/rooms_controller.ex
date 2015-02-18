defmodule ImHere.Api.RoomsController do
  use Phoenix.Controller

  plug :action

  def listRooms(conn, _params) do
    json conn, %{id: "ok"}
  end
end
