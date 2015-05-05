require 'rails_helper'

RSpec.describe "hoods/index", type: :view do
  before(:each) do
    assign(:hoods, [
      Hood.create!(
        :address => "MyText",
        :city => "MyText",
        :state => "MyText",
        :country => "MyText",
        :longitude => "MyText",
        :latitude => "MyText"
      ),
      Hood.create!(
        :address => "MyText",
        :city => "MyText",
        :state => "MyText",
        :country => "MyText",
        :longitude => "MyText",
        :latitude => "MyText"
      )
    ])
  end

  it "renders a list of hoods" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
