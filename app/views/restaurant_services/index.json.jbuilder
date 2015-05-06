json.array!(@restaurant_services) do |restaurant_service|
  json.extract! restaurant_service, :id, :restaurant_id, :service_id, :url
  json.url restaurant_service_url(restaurant_service, format: :json)
end
