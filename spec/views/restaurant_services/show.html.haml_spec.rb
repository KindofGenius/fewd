require 'rails_helper'

RSpec.describe "restaurant_services/show", type: :view do
  before(:each) do
    @restaurant_service = assign(:restaurant_service, RestaurantService.create!(
      :restaurant_id => 1,
      :service_id => 2,
      :url => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/MyText/)
  end
end
