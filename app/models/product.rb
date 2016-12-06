class Product < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :categories, through: :tags
  has_many :tags
  validates :name, presence: true
  validates :description, presence: true
  validates :name, length: { maximum: 100 }
end
