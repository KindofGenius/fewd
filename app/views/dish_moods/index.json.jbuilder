json.array!(@dish_moods) do |dish_mood|
  json.extract! dish_mood, :id, :dish_id, :mood_id
  json.url dish_mood_url(dish_mood, format: :json)
end
