json.array!(@dish_foods) do |dish_food|
  json.extract! dish_food, :id, :dish_id, :food_id
  json.url dish_food_url(dish_food, format: :json)
end
