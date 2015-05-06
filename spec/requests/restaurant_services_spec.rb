require 'rails_helper'

RSpec.describe "RestaurantServices", type: :request do
  describe "GET /restaurant_services" do
    it "works! (now write some real specs)" do
      get restaurant_services_path
      expect(response).to have_http_status(200)
    end
  end
end
