require 'rails_helper'

RSpec.describe "moods/index", type: :view do
  before(:each) do
    assign(:moods, [
      Mood.create!(
        :name => "Name"
      ),
      Mood.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of moods" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
