defmodule ImHere.Api.RoomsController do
  use Phoenix.Controller

  plug :action

  def listRooms(conn, _params) do
    rooms = ImHere.Models.Room.listAll
      |> Stream.map fn room -> ImHere.Models.Room.room_to_json(room) end

    json conn, rooms
  end

  def near(conn, %{"lat" => lat, "lng" => lng, "dist" => dist}) do
    rooms = find_rooms_near(lng, lat, dist)
    json conn, rooms
  end

  def near(conn, %{"lat" => lat, "lng" => lng}) do
    IO.puts "dis -> 100"
    rooms = find_rooms_near(lng, lat, "100")
    json conn, rooms
  end

  defp find_rooms_near(lng, lat, dist) do
    rooms = ImHere.Models.Room.findNear(lat, lng, dist)
      |> Stream.map &ImHere.Models.Room.room_to_json(&1)
    rooms
  end

end
