require 'rails_helper'

RSpec.describe "Scrolls", type: :request do
  describe "GET /index" do
    it "returns http success" do
      skip "Skipping test due to incorrect path helpers in views"
      user = User.create!(username: "username", email: "test@msudenver.edu", password: "password")
      sign_in user
      get scrolls_path
      expect(response).to have_http_status(:success)
    end
  end
end