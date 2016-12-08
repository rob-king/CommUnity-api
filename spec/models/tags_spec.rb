require "rails_helper"

RSpec.describe Tag, type: :model do
  it "does not allow a tag without a product"
  it "does not allow a tag without a category"
end
