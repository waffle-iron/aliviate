require "rails_helper"

RSpec.describe Product, type: :model do
  describe ".valid?" do
    it "returns true when not errors" do
      product = create(:product)
      expect(product.valid?).to eq(true)
    end

    it "returns false when errors" do
      product = Product.new(name: "Acetaminofén")
      expect(product.valid?).to eq(false)
    end
  end
end
