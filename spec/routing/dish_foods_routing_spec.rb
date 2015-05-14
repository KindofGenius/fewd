require "rails_helper"

RSpec.describe DishFoodsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/dish_foods").to route_to("dish_foods#index")
    end

    it "routes to #new" do
      expect(:get => "/dish_foods/new").to route_to("dish_foods#new")
    end

    it "routes to #show" do
      expect(:get => "/dish_foods/1").to route_to("dish_foods#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/dish_foods/1/edit").to route_to("dish_foods#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/dish_foods").to route_to("dish_foods#create")
    end

    it "routes to #update" do
      expect(:put => "/dish_foods/1").to route_to("dish_foods#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/dish_foods/1").to route_to("dish_foods#destroy", :id => "1")
    end

  end
end
