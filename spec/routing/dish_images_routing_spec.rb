require "rails_helper"

RSpec.describe DishImagesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/dish_images").to route_to("dish_images#index")
    end

    it "routes to #new" do
      expect(:get => "/dish_images/new").to route_to("dish_images#new")
    end

    it "routes to #show" do
      expect(:get => "/dish_images/1").to route_to("dish_images#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/dish_images/1/edit").to route_to("dish_images#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/dish_images").to route_to("dish_images#create")
    end

    it "routes to #update" do
      expect(:put => "/dish_images/1").to route_to("dish_images#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/dish_images/1").to route_to("dish_images#destroy", :id => "1")
    end

  end
end
