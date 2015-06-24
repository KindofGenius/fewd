require "rails_helper"

RSpec.describe EmailUpdatesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/email_updates").to route_to("email_updates#index")
    end

    it "routes to #new" do
      expect(:get => "/email_updates/new").to route_to("email_updates#new")
    end

    it "routes to #show" do
      expect(:get => "/email_updates/1").to route_to("email_updates#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/email_updates/1/edit").to route_to("email_updates#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/email_updates").to route_to("email_updates#create")
    end

    it "routes to #update" do
      expect(:put => "/email_updates/1").to route_to("email_updates#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/email_updates/1").to route_to("email_updates#destroy", :id => "1")
    end

  end
end
