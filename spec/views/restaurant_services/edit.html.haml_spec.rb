require 'rails_helper'

RSpec.describe "restaurant_services/edit", type: :view do
  before(:each) do
    @restaurant_service = assign(:restaurant_service, RestaurantService.create!(
      :restaurant_id => 1,
      :service_id => 1,
      :url => "MyText"
    ))
  end

  it "renders the edit restaurant_service form" do
    render

    assert_select "form[action=?][method=?]", restaurant_service_path(@restaurant_service), "post" do

      assert_select "input#restaurant_service_restaurant_id[name=?]", "restaurant_service[restaurant_id]"

      assert_select "input#restaurant_service_service_id[name=?]", "restaurant_service[service_id]"

      assert_select "textarea#restaurant_service_url[name=?]", "restaurant_service[url]"
    end
  end
end
