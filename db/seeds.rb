# frozen_string_literal: true
Order.destroy_all
Item.destroy_all
Category.destroy_all
User.destroy_all

User.create(email:'Webmaster@gmail.com', password:'0000', admin:true, name:'Pedro')


Category.create(name: 'popular')
Category.create(name: 'nigiri')
Category.create(name: 'sashimi')
Category.create(name: 'maki')
Category.create(name: 'uramaki')
Category.create(name: 'temaki')
Category.create(name: 'offers')
Category.create(name: 'sets')

Category.all.each do |category|
  15.times do
    Item.create(
      name: Faker::Food.sushi,
      description: Faker::Food.description,
      pieces: Faker::Number.within(range: 4..24),
      price: Faker::Commerce.price(range: 2.99..19.99),
      image: Faker::LoremFlickr.image(size: "650x325", search_terms: ['sushi']),
      category: category
    )
  end
end
