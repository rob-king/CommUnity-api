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


12.times {
  Product.create({
  name: Faker::Commerce.product_name,
  description: Faker::Hipster.paragraphs(3).join(' '),
  imageURL: Faker::Internet.url
 })
}

products = Product.all

products.each { |product|
  3.times {
    product.comments.create({
      author: Faker::Name.name,
      body: Faker::Hipster.paragraphs(3).join(' ')
      })
    }
}
