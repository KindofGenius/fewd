require 'rails_helper'

RSpec.describe "moods/new", type: :view do
  before(:each) do
    assign(:mood, Mood.new(
      :name => "MyString"
    ))
  end

  it "renders new mood form" do
    render

    assert_select "form[action=?][method=?]", moods_path, "post" do

      assert_select "input#mood_name[name=?]", "mood[name]"
    end
  end
end
