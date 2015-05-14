json.array!(@diet_dishes) do |diet_dish|
  json.extract! diet_dish, :id, :dish_id, :diet_id
  json.url diet_dish_url(diet_dish, format: :json)
end
