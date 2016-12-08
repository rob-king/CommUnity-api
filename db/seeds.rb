# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



require 'faker'

#Clear out the database
Product.destroy_all
Comment.destroy_all
Category.destroy_all

categories =  ["app", "health", "finance", "learning", "poverty", "data", "map"]
images =
['http://i.imgur.com/N6dntjh.jpg',
  'http://i.imgur.com/jFfTTZK.jpg',
  'http://i.imgur.com/xBdJiTA.jpg',
  'http://i.imgur.com/QDzMQYS.jpg',
  'http://i.imgur.com/O2zyHHj.jpg',
  'http://i.imgur.com/vU87I9G.jpg',
  'http://i.imgur.com/YbixTEx.jpg',
  'http://i.imgur.com/iSP8n1N.jpg',
  'http://i.imgur.com/Ge7zCOv.jpg',
  'http://i.imgur.com/Wgl3prw.jpg',
  'http://i.imgur.com/Ge7zCOv.jpg',
  'http://i.imgur.com/Ge7zCOv.jpg'
]



categories.each { |category|
  Category.create(name: category)
}


count = 0

12.times {
  Product.create({
  name: Faker::Commerce.product_name,
  description: Faker::Hipster.paragraphs(3).join(' '),
  imageURL: images[count],
  votes: rand(1..100),
  author: Faker::Name.name,
  authorAvatar: Faker::Avatar.image
 })
 count += 1
}

products = Product.all

products.each { |product|
  rand(3..7).times {
    product.comments.create({
      author: Faker::Name.name,
      body: Faker::Hipster.paragraphs(3).join(' ')
      })
    }

  rand(3..5).times {
    category = Category.find_by(name: categories.sample)
    product.tags.create(category:category) unless product.categories.pluck(:id).include? category.id
  }

}
