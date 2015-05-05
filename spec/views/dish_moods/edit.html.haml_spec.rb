require 'rails_helper'

RSpec.describe "dish_moods/edit", type: :view do
  before(:each) do
    @dish_mood = assign(:dish_mood, DishMood.create!(
      :dish_id => 1,
      :mood_id => 1
    ))
  end

  it "renders the edit dish_mood form" do
    render

    assert_select "form[action=?][method=?]", dish_mood_path(@dish_mood), "post" do

      assert_select "input#dish_mood_dish_id[name=?]", "dish_mood[dish_id]"

      assert_select "input#dish_mood_mood_id[name=?]", "dish_mood[mood_id]"
    end
  end
end
