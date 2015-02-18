defmodule ImHere.Api.Rooms do
  use Phoenix.Controller

  plug :action

  def listRooms(conn, _params) do
    json conn, %{id: "ok"}
  end
end
