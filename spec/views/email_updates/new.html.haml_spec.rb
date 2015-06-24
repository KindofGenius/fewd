require 'rails_helper'

RSpec.describe "email_updates/new", type: :view do
  before(:each) do
    assign(:email_update, EmailUpdate.new(
      :email => "MyString"
    ))
  end

  it "renders new email_update form" do
    render

    assert_select "form[action=?][method=?]", email_updates_path, "post" do

      assert_select "input#email_update_email[name=?]", "email_update[email]"
    end
  end
end
