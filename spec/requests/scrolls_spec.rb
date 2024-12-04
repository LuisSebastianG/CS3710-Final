require 'rails_helper'

RSpec.describe "Scrolls", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/scrolls/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/scrolls/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/scrolls/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/scrolls/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
