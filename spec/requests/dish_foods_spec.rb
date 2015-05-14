require 'rails_helper'

RSpec.describe "DishFoods", type: :request do
  describe "GET /dish_foods" do
    it "works! (now write some real specs)" do
      get dish_foods_path
      expect(response).to have_http_status(200)
    end
  end
end
