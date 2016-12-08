require "rails_helper"

RSpec.describe Comment, type: :model do
  it "cannot be created without body content"
  it "cannot be created without an author"
  it "cannot be created without being associated with a Product"
end
