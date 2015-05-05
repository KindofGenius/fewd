require 'rails_helper'

RSpec.describe "hoods/new", type: :view do
  before(:each) do
    assign(:hood, Hood.new(
      :address => "MyText",
      :city => "MyText",
      :state => "MyText",
      :country => "MyText",
      :longitude => "MyText",
      :latitude => "MyText"
    ))
  end

  it "renders new hood form" do
    render

    assert_select "form[action=?][method=?]", hoods_path, "post" do

      assert_select "textarea#hood_address[name=?]", "hood[address]"

      assert_select "textarea#hood_city[name=?]", "hood[city]"

      assert_select "textarea#hood_state[name=?]", "hood[state]"

      assert_select "textarea#hood_country[name=?]", "hood[country]"

      assert_select "textarea#hood_longitude[name=?]", "hood[longitude]"

      assert_select "textarea#hood_latitude[name=?]", "hood[latitude]"
    end
  end
end
