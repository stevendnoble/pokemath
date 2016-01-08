require 'rails_helper'

RSpec.describe SiteController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #tile" do
    it "returns http success" do
      get :tile
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #browsertoosmall" do
    it "returns http success" do
      get :browsertoosmall
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #noscrolling" do
    it "returns http success" do
      get :noscrolling
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #navbar" do
    it "returns http success" do
      get :navbar
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #instructions" do
    it "returns http success" do
      get :instructions
      expect(response).to have_http_status(:success)
    end
  end

end
