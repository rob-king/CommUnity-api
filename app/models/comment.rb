class Comment < ApplicationRecord
  belongs_to :product
  validates :body, presence: true, length: {maximum: 1000}
  validates :author , presence: true
  validates :product, presence: true
end
