task :import_seamless => :environment do
  require 'csv'
  csv_path = Rails.root.join("public", "uws-seamless.csv")
  csv_text = File.read(csv_path)
  csv = CSV.parse(csv_text, :headers => true)
  csv.each do |row|
    begin  
      restaurant = Restaurant.where(name: row["name"], address: row["address"]).first_or_create do |f|
        f.name = row["name"] if row["name"] != "NULL"
        f.address = row["address"] if row["address"] != "NULL"
        #f.city = row["city"] if row["city"] != "NULL"
        #f.state = row["state"] if row["state"] != "NULL"
        f.city = "New York"
        f.state = "New York"
      end
      RestaurantService.where(service_id: 1, restaurant_id: restaurant.id).first_or_create do |f|
        f.service_id = 1
        f.restaurant_id = restaurant.id
        f.url = row["href"]
      end

    rescue
      #binding.pry
    end
  end
end

task :import_delivery => :environment do
  require 'csv'
  csv_path = Rails.root.join("public", "uws-delivery.csv")
  csv_text = File.read(csv_path)
  csv = CSV.parse(csv_text, :headers => true)
  csv.each do |row|
    begin  
      look = "#{row['address'].split("(").first.chop} NY, NY"
      cords = Geocoder.coordinates(look)
      restaurant = Restaurant.where(longitude: cords.last, latitude: cords.first).first_or_create do |f|
        f.name = row["name"] if row["name"] != "NULL"
        f.address = row['address'].split("(").first.chop if row["address"] != "NULL"
        f.city = "New York"
        f.state = "NY"
      end
      RestaurantService.where(service_id: 2, restaurant_id: restaurant.id).first_or_create do |f|
        f.service_id = 2
        f.restaurant_id = restaurant.id
        f.url = row["href"]
      end

    rescue
      #binding.pry
    end
  end
end