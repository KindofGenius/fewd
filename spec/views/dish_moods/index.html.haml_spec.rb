require 'rails_helper'

RSpec.describe "dish_moods/index", type: :view do
  before(:each) do
    assign(:dish_moods, [
      DishMood.create!(
        :dish_id => 1,
        :mood_id => 2
      ),
      DishMood.create!(
        :dish_id => 1,
        :mood_id => 2
      )
    ])
  end

  it "renders a list of dish_moods" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
