class Comment < ApplicationRecord
  belongs_to :product
  validates :body, presence: true, length: {maximum: 100}
  validates :author , presence: true
end
