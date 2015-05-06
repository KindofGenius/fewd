require "rails_helper"

RSpec.describe RestaurantServicesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/restaurant_services").to route_to("restaurant_services#index")
    end

    it "routes to #new" do
      expect(:get => "/restaurant_services/new").to route_to("restaurant_services#new")
    end

    it "routes to #show" do
      expect(:get => "/restaurant_services/1").to route_to("restaurant_services#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/restaurant_services/1/edit").to route_to("restaurant_services#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/restaurant_services").to route_to("restaurant_services#create")
    end

    it "routes to #update" do
      expect(:put => "/restaurant_services/1").to route_to("restaurant_services#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/restaurant_services/1").to route_to("restaurant_services#destroy", :id => "1")
    end

  end
end
