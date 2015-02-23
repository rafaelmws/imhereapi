
defmodule ImHere.Models.Room do

  def listAll do
    rooms = get_collection("rooms") |> Mongo.Collection.find
    rooms
  end

  def findNear(lat, lng, dist) do
    geometry = %{ 
      type: "Point", 
      coordinates: [String.to_float(lng), String.to_float(lat)]
    }
  
    near = %{ 
      "$geometry": geometry, 
      "$minDistance": 0, 
      "$maxDistance": String.to_integer(dist)
    }

    collection = get_collection("rooms")
    rooms = Mongo.Collection.find(collection, %{ location: %{ "$near": near} })
    rooms
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
