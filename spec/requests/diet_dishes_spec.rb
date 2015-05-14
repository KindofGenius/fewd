require 'rails_helper'

RSpec.describe "DietDishes", type: :request do
  describe "GET /diet_dishes" do
    it "works! (now write some real specs)" do
      get diet_dishes_path
      expect(response).to have_http_status(200)
    end
  end
end
