require "rails_helper"

RSpec.describe UsersController, type: :controller do

  let(:user) { create(:user) }

  describe "Users Update" do
    it "PUT update/:id" do
      put :update, params: {id: user.id, user: {full_name: "Carlos"}}
      user.reload
      expect(user.full_name).eql?(:full_name)
      expect(response).to redirect_to proc { edit_user_url(user) }
    end
  end

  describe "PUT update/:id" do
    it "returns http success" do
      put :update, params: {id: user.id, user: {password: "123456"}}
      user.reload
      expect(user.password).eql?(:password)
      expect(response).to redirect_to root_path
    end
  end

  describe "GET edit" do
    it "returns http success" do
      get :edit, params: {id: user.id}
      expect(response).to redirect_to proc {edit_user_url(user)}
    end
  end

end
