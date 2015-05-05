require 'rails_helper'

RSpec.describe "restaurants/index", type: :view do
  before(:each) do
    assign(:restaurants, [
      Restaurant.create!(
        :name => "Name",
        :address => "MyText",
        :city => "City",
        :state => "State",
        :country => "Country",
        :longitude => 1.5,
        :latitude => 1.5
      ),
      Restaurant.create!(
        :name => "Name",
        :address => "MyText",
        :city => "City",
        :state => "State",
        :country => "Country",
        :longitude => 1.5,
        :latitude => 1.5
      )
    ])
  end

  it "renders a list of restaurants" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Country".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
