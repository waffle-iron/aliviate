require "rails_helper"

RSpec.describe Admin::ProductsController, type: :controller do
  let(:product) { create(:product) }
  before(:each) { create_logged_in_user }

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET edit" do
    it "returns http success" do
      get :edit, params: { id: product.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT update" do
    it "updates product information" do
      put :update, params: { id: product.id, product: { name: "Pastillas Miguel" } }
      product.reload
      expect(product.name).to eq("Pastillas Miguel")
    end

    it "redirects when sucessful" do
      put :update, params: { id: product.id, product: { name: "Pastillas Miguel" } }
      expect(response).to redirect_to(admin_products_url)
    end

    it "re-renders page when validations errors" do
      put :update, params: { id: product.id, product: { name: "" } }
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST create" do
    let(:valid_product) do
      {
        name: "My Awesome Product",
        description: "Awesome product",
        price: 18900,
        quantity: 5
      }
    end

    it "creates a new product" do
      get :create, params: { product: valid_product }
      product = Product.last
      expect(product.name).to eq("My Awesome Product")
    end

    it "redirects when successful" do
      get :create, params: { product: valid_product }
      expect(response).to redirect_to(admin_products_url)
    end

    it "re-renders page when validation errors" do
      get :create, params: { product: { name: "" } }
      expect(response).to have_http_status(:success)
    end
  end

  describe "DELETE destroy" do
    it "destroys a product" do
      product = create(:product)
      expect {
        delete :destroy, params: { id: product.to_param }
      }.to change(Product, :count).by(-1)
    end
  end
end
