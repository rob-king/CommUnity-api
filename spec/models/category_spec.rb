require "rails_helper"

RSpec.describe Category, type: :model do
  it "does not allow categories to be created without a name"  do
    test =  Category.create()
    expect(test.errors.details[:name]).to eq([{error: :blank}, {error: :too_short, count: 1}])
  end


end
