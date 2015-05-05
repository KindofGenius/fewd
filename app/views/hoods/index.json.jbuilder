json.array!(@hoods) do |hood|
  json.extract! hood, :id, :address, :city, :state, :country, :longitude, :latitude
  json.url hood_url(hood, format: :json)
end
