class Product < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :categories, through: :tags
  has_many :tags, dependent: :destroy
  validates :name, presence: true
  validates :description, presence: true
  validates :name, length: { maximum: 100 }

  def update_tags(tags_list)
    current_tags = self.categories.pluck(:name)
    tags_to_add = tags_list - current_tags
    tags_to_remove = current_tags - tags_list

    tags_to_add.each {|tag|
      create_tag tag.downcase
    }

    tags_to_remove.each{ |tag|
      remove_tag tag.downcase
    }
    self.reload
  end

  private

  def create_tag(tag_string)
    category = Category.find_by(name: tag_string)
    if category
      self.tags.create(category: category) unless self.categories.pluck(:name).include? tag_string
    else
      self.categories.create(name: tag_string)
    end
  end

  def remove_tag(tag_string)
    category = Category.find_by(name: tag_string)
    tag = Tag.find_by(product: self, category: category)
    tag.destroy
  end
end
