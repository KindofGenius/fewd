require 'rails_helper'

RSpec.describe "diet_dishes/show", type: :view do
  before(:each) do
    @diet_dish = assign(:diet_dish, DietDish.create!(
      :dish_id => 1,
      :diet_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
  end
end
