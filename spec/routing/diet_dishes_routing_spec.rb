require "rails_helper"

RSpec.describe DietDishesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/diet_dishes").to route_to("diet_dishes#index")
    end

    it "routes to #new" do
      expect(:get => "/diet_dishes/new").to route_to("diet_dishes#new")
    end

    it "routes to #show" do
      expect(:get => "/diet_dishes/1").to route_to("diet_dishes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/diet_dishes/1/edit").to route_to("diet_dishes#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/diet_dishes").to route_to("diet_dishes#create")
    end

    it "routes to #update" do
      expect(:put => "/diet_dishes/1").to route_to("diet_dishes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/diet_dishes/1").to route_to("diet_dishes#destroy", :id => "1")
    end

  end
end
