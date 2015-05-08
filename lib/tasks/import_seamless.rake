task :import_seamless => :environment do
  require 'csv'
  csv_path = Rails.root.join("public", "seamless-manhattan.csv")
  csv_text = File.read(csv_path)
  csv = CSV.parse(csv_text, :headers => true)
  csv.each do |row|
    begin  
      restaurant = Restaurant.where(name: row["name"], address: row["address"]).first_or_create do |f|
        f.name = row["name"] if row["name"] != "NULL"
        f.address = row["address"] if row["address"] != "NULL"
        f.city = row["city"] if row["city"] != "NULL"
        f.state = row["state"] if row["state"] != "NULL"
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