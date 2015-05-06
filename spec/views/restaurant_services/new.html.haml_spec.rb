require 'rails_helper'

RSpec.describe "restaurant_services/new", type: :view do
  before(:each) do
    assign(:restaurant_service, RestaurantService.new(
      :restaurant_id => 1,
      :service_id => 1,
      :url => "MyText"
    ))
  end

  it "renders new restaurant_service form" do
    render

    assert_select "form[action=?][method=?]", restaurant_services_path, "post" do

      assert_select "input#restaurant_service_restaurant_id[name=?]", "restaurant_service[restaurant_id]"

      assert_select "input#restaurant_service_service_id[name=?]", "restaurant_service[service_id]"

      assert_select "textarea#restaurant_service_url[name=?]", "restaurant_service[url]"
    end
  end
end
