json.array!(@restaurants) do |restaurant|
  json.extract! restaurant, :id, :name, :address, :city, :state, :country, :longitude, :latitude
  json.url restaurant_url(restaurant, format: :json)
end
