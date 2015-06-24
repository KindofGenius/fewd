require 'rails_helper'

RSpec.describe "email_updates/index", type: :view do
  before(:each) do
    assign(:email_updates, [
      EmailUpdate.create!(
        :email => "Email"
      ),
      EmailUpdate.create!(
        :email => "Email"
      )
    ])
  end

  it "renders a list of email_updates" do
    render
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end
