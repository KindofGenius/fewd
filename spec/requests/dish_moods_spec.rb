require 'rails_helper'

RSpec.describe "DishMoods", type: :request do
  describe "GET /dish_moods" do
    it "works! (now write some real specs)" do
      get dish_moods_path
      expect(response).to have_http_status(200)
    end
  end
end
