json.array!(@dish_images) do |dish_image|
  json.extract! dish_image, :id, :dish_id
  json.url dish_image_url(dish_image, format: :json)
end
