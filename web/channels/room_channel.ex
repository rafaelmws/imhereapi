defmodule ImHere.Channels.RoomChannel do
  use Phoenix.Channel

  def join("room:" <> _room_name, message, socket) do
    IO.puts "Join room:" <> _room_name
    {:ok, socket}
  end

  def handle_in("room:in", message, socket) do
    broadcast socket, message["to"], %{data: message["data"]}
    {:ok, socket}
  end

end
