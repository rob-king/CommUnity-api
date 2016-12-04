class Comment < ApplicationRecord
  belongs_to :product
  validates :body, presence: true
  validates :author , presence: true
  validates :body, length: { maximum: 100}
