require 'rails_helper'

RSpec.describe FakersController, type: :controller do
  describe "GET /index" do
    it "get faker data" do
      get :index,   params: {data_class: "Name", data_quantity: "10"}
      expect(response).to have_http_status(:ok) 
    end
  end
end
