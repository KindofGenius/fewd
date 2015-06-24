require 'rails_helper'

RSpec.describe "EmailUpdates", type: :request do
  describe "GET /email_updates" do
    it "works! (now write some real specs)" do
      get email_updates_path
      expect(response).to have_http_status(200)
    end
  end
end
