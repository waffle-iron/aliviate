require "rails_helper"

RSpec.describe Admin::PostsController, type: :controller do

  let(:post) { create(:post) }
  before(:each) { create_logged_in_user }

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET edit" do
    it "returns http success" do
      get :edit, params: {id: post.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT update" do
    it "updates post information" do
      put :update, params: {id: post.id, post: {title: "Other title"}}
      post.reload
      expect(post.title).to eq("Other title")
    end

    it "redirects when sucessful" do
      put :update, params: {id: post.id, post: {title: "Other title"}}
      expect(response).to redirect_to(admin_posts_url)
    end

    it "re-renders page when validation errors" do
      put :update, params: {id: post.id, post: {title: ""}}
      expect(response).to have_http_status(:success)
    end

    it "updates tags of post" do
      put :update, params: {id: post.id, post: {tag_list: "health"}}
      post.reload
      expect(post.tag_list).to eq(["health"])
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST create" do
    let(:valid_post) do
      {
        title: "Valid title",
        summary: "Valid summary",
        content: "<p> This is a valid content</p>",
        published: true,
        tag_list: "wellness, health"
      }
    end

    it "creates a new post" do
      get :create, params: { post: valid_post }
      post = Post.last
      expect(post.title).to eq("Valid title")
    end

    it "add tags in new post" do
      get :create, params: { post: valid_post }
      post = Post.last
      expect(post.tag_list).to eq(["health", "wellness"])
    end

    it "redirects when successful" do
      get :create, params: { post: valid_post }
      expect(response).to redirect_to(admin_posts_url)
    end

    it "re-renders page when validation errors" do
      get :create, params: {post: { title: "" }}
      expect(response).to have_http_status(:success)
    end
  end

  describe "DELETE destroy" do
    it "destroys a post" do
      post = create(:post)
      expect {
        delete :destroy, params: {id: post.to_param}
      }.to change(Post, :count).by(-1)
    end

    it "redirects to the posts list" do
      post = create(:post)
      delete :destroy, params: {id: post.to_param}
      expect(response).to redirect_to(admin_posts_url)
    end
  end
end
