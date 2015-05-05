require "rails_helper"

RSpec.describe DishMoodsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/dish_moods").to route_to("dish_moods#index")
    end

    it "routes to #new" do
      expect(:get => "/dish_moods/new").to route_to("dish_moods#new")
    end

    it "routes to #show" do
      expect(:get => "/dish_moods/1").to route_to("dish_moods#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/dish_moods/1/edit").to route_to("dish_moods#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/dish_moods").to route_to("dish_moods#create")
    end

    it "routes to #update" do
      expect(:put => "/dish_moods/1").to route_to("dish_moods#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/dish_moods/1").to route_to("dish_moods#destroy", :id => "1")
    end

  end
end
