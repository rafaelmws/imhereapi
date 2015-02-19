
defmodule ImHere.Models.Room do

  def listAll do
    get_collection "rooms" |> Mongo.Collection.find
  end

  def findNear(lat, lng) do
    IO.puts "Lat e Lng" <> lat <> lng
  end

  def room_to_json(room) do
    %{
      name: room[:name],
      location: %{ coordinates: room[:location][:coordinates] },
      slug: room[:name],
    }
  end

  defp get_collection(collection_name) do
    mongo = Mongo.connect!
    db = mongo |> Mongo.db("chatroom")
    coll = db |> Mongo.Db.collection(collection_name)
    coll
  end

end
