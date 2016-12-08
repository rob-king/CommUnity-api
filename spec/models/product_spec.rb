require "rails_helper"

RSpec.describe Product, type: :model do
  it "does not allow products with a blank name"
  it "does not allow a name longer than 100 characters"
  it "does not allow products with a blank description"
end
