require "rails_helper"

RSpec.describe UsersController, type: :controller do



  let(:user) { create(:user) }
  before(:each) { sign_in(user) }

  describe "PUT update" do
    it "updates user information" do
      put :update, params: {id: user.id, user: {full_name: "Alberto"}}
      user.reload
      expect(user.full_name).to eq("Alberto")
      expect(response).to redirect_to proc {edit_user_url(user)}
    end

  end

  describe "GET edit" do
    it "returns http success" do
      get :edit, params: {id: user.id}
      expect(response).to have_http_status(:success)
    end
  end

end
