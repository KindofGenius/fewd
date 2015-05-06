require 'rails_helper'

RSpec.describe "restaurant_services/index", type: :view do
  before(:each) do
    assign(:restaurant_services, [
      RestaurantService.create!(
        :restaurant_id => 1,
        :service_id => 2,
        :url => "MyText"
      ),
      RestaurantService.create!(
        :restaurant_id => 1,
        :service_id => 2,
        :url => "MyText"
      )
    ])
  end

  it "renders a list of restaurant_services" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
