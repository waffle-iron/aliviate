require "rails_helper"

RSpec.describe ActsAsTaggableOn::Tag, type: :model do
  describe ".valid?" do
    it "returns true when not errors" do
      tag = ActsAsTaggableOn::Tag.create(name: "Naturista")
      expect(tag.valid?).to eq(true)
    end

    it "returns false when errors" do
      tag = ActsAsTaggableOn::Tag.create(name: "")
      expect(tag.valid?).to eq(false)
    end
  end
end
