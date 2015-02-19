require BsonJson

defmodule ImHere.Api.RoomsController do
  use Phoenix.Controller

  plug :action

  def listRooms(conn, _params) do
    rooms = ImHere.Models.Room.listAll
      |> Stream.map fn room -> ImHere.Models.Room.room_to_json(room) end

    json conn, rooms
  end

  def near(conn, %{"lat" => lat, "lng" => lng}) do
    rooms = ImHere.Models.Room.findNear(lat, lng)
      |> Stream.map fn room -> ImHere.Models.Room.room_to_json(room) end
    json conn, rooms
  end

end
