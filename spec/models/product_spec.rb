require "rails_helper"

RSpec.describe Product, type: :model do
  it "does not allow products with a blank name"
  it "does not allow a name longer than 100 characters"
  it "does not allow products with a blank description"

  describe "#update_tags" do
    test_product = Product.create(name: "test product", description: "test description")

    it "it adds a tag when the tag is currently not associated with a product" do
      add_tags =  ["map", "data", "happiness"]
      test_product.update_tags(add_tags)
      expect(test_product.categories.pluck(:name)).to eq(add_tags)
    end

    it "removes a tag when it is left out of the passed in array" do
      test_tags = ["map", "data"]
      test_product.update_tags(test_tags)
      expect(test_product.categories.pluck(:name)).to eq(test_tags)
    end

    it "deletes all tags when update_tags is passed an empty array" do
      test_product.update_tags([])
      expect(test_product.categories.pluck(:name)).to eq([])
    end
  end

end
