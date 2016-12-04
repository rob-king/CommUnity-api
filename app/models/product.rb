class Product < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :name, presence: true
  validates :description, presence: true
  validates :name, length: { maximum: 100 }
end
