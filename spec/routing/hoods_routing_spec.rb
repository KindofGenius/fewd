require "rails_helper"

RSpec.describe HoodsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/hoods").to route_to("hoods#index")
    end

    it "routes to #new" do
      expect(:get => "/hoods/new").to route_to("hoods#new")
    end

    it "routes to #show" do
      expect(:get => "/hoods/1").to route_to("hoods#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/hoods/1/edit").to route_to("hoods#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/hoods").to route_to("hoods#create")
    end

    it "routes to #update" do
      expect(:put => "/hoods/1").to route_to("hoods#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/hoods/1").to route_to("hoods#destroy", :id => "1")
    end

  end
end
