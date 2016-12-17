require "rails_helper"

RSpec.describe Post, type: :model do
  describe ".valid?" do
    it "returns true when not errors" do
      post = create(:post)
      expect(post.valid?).to eq(true)
    end

    it "returns false when errors" do
      product = Post.new(title: "Awesome Title")
      expect(product.valid?).to eq(false)
    end
  end
end
