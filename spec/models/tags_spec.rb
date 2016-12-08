require "rails_helper"

RSpec.describe Tag, type: :model do
  test_product =  Product.create(name: "tester_bro", description: "tester_bro")
  test_category =  Category.create(name:"category_test")
  it "does not allow a tag without a product" do
    test_tag = Tag.new(category: test_category)
    test_tag.save
    expect(test_tag.errors.details[:product]).to eq([{:error=>:blank}, {:error=>:blank}])
  end
  it "does not allow a tag without a category" do
    test_tag = Tag.create(product: test_product)
    test_tag.save
    expect(test_tag.errors.details[:category]).to eq([{:error=>:blank}, {:error=>:blank}])
  end

end
