require "rails_helper"

RSpec.describe Admin::DashboardsController, type: :controller do

  let(:user) { create(:user) }
  before(:each) { create_logged_in_user }

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
