json.array!(@dishes) do |dish|
  json.extract! dish, :id, :restaurant_id, :name
  json.url dish_url(dish, format: :json)
end
