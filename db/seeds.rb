# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Seeding Data ..."

# Helper functions
def open_asset(file_name)
  File.open(Rails.root.join('db', 'seed_assets', file_name))
end

# Only run on development (local) instances not on production, etc.
unless Rails.env.development?
  puts "Development seeds only (for now)!"
  exit 0
end

# Let's do this ...

## CATEGORIES

puts "Finding or Creating Categories ..."

cat1 = Category.find_or_create_by! name: 'Apparel'
cat2 = Category.find_or_create_by! name: 'Electronics'
cat3 = Category.find_or_create_by! name: 'Furniture'

## PRODUCTS

puts "Re-creating Products ..."

Product.destroy_all

cat1.products.create!({
  name:  'Men\'s Classy shirt',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel1.jpg'),
  quantity: 10,
  price: 64.99
})

cat1.products.create!({
  name:  'Women\'s Zebra pants',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel2.jpg'),
  quantity: 18,
  price: 124.99
})

cat1.products.create!({
  name:  'Hipster Hat',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel3.jpg'),
  quantity: 0,
  price: 34.49
})

cat1.products.create!({
  name:  'Hipster Socks',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel4.jpg'),
  quantity: 8,
  price: 25.00
})

cat1.products.create!({
  name:  'Russian Spy Shoes',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel5.jpg'),
  quantity: 0,
  price: 1_225.00
})

cat1.products.create!({
  name:  'Human Feet Shoes',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel6.jpg'),
  quantity: 82,
  price: 224.50
})


cat2.products.create!({
  name:  'Modern Skateboards',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('electronics1.jpg'),
  quantity: 40,
  price: 164.49
})

cat2.products.create!({
  name:  'Hotdog Slicer',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('electronics2.jpg'),
  quantity: 3,
  price: 26.00
})

cat2.products.create!({
  name:  'World\'s Largest Smartwatch',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('electronics3.jpg'),
  quantity: 32,
  price: 2_026.29
})

cat3.products.create!({
  name:  'Optimal Sleeping Bed',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('furniture1.jpg'),
  quantity: 320,
  price: 3_052.00
})

cat3.products.create!({
  name:  'Electric Chair',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('furniture2.jpg'),
  quantity: 2,
  price: 987.65
})

cat3.products.create!({
  name:  'Red Bookshelf',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('furniture3.jpg'),
  quantity: 23,
  price: 2_483.75
})

## CREATE INITIAL USERS FOR THE REVIEWS
User.create!({
  first_name:      'Nik',
  last_name:       'Mal',
  email:           'wet_dog@hotmail.com',
  password_digest: '###'
})

User.create!({
  first_name:      'Quavo',
  last_name:       'Huncho',
  email:           'quavo_qc@hotmail.com',
  password_digest: '###'
})

## REVIEWS
puts "Adding some reviews to each product ..."

product_1 = Product.find_by(id: 1)
product_2 = Product.find_by(id: 2)
product_3 = Product.find_by(id: 3)
product_4 = Product.find_by(id: 4)
product_5 = Product.find_by(id: 5)
product_6 = Product.find_by(id: 6)
product_7 = Product.find_by(id: 7)
product_8 = Product.find_by(id: 8)
product_9 = Product.find_by(id: 9)

product_1.reviews.create!({
  product_id: 1,
  user_id: 1,
  description: "THE BEST. THE BEST. THE BEST.",
  rating: 4
})

product_1.reviews.create!({
  product_id: 1,
  user_id: 2,
  description: "Worst. Shirt. Ever.",
  rating: 1
})

product_2.reviews.create!({
  product_id: 1,
  user_id: 1,
  description: "These pants are see-through.",
  rating: 3
})

product_3.reviews.create!({
  product_id: 1,
  user_id: 1,
  description: "Nothing screams 'nice' guy more than this hat.",
  rating: 1
})

product_4.reviews.create!({
  product_id: 1,
  user_id: 2,
  description: "Rock my socks YUH!",
  rating: 5
})

product_5.reviews.create!({
  product_id: 1,
  user_id: 2,
  description: "Dis da DRIP!",
  rating: 5
})

product_6.reviews.create!({
  product_id: 1,
  user_id: 1,
  description: "I bought my son these for his birthday, and he exclaimed, 'What are thoooooose!'",
  rating: 2
})

product_7.reviews.create!({
  product_id: 1,
  user_id: 1,
  description: "This is cool! What does pushing mongo mean though? Apparently that's what i'm doing...",
  rating: 3
})

product_8.reviews.create!({
  product_id: 1,
  user_id: 2,
  description: "Slice n Dice... iss nice! *dab*",
  rating: 4
})

product_9.reviews.create!({
  product_id: 1,
  user_id: 2,
  description: "After I got this, I threw away all my other jewelery. This is all I need.",
  rating: 5
})



puts "DONE!"
