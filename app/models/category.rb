class Category < ApplicationRecord
  has_many :products, through: :tags
end
