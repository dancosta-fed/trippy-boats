# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'


puts "Adding Mr. Fabio..."
user = User.create!(fullname: 'Fabio', email: "fabio@gmail.com", password: '123456')

puts 'Creating 50 fake users...'

50.times do
  user = User.new(
    email:    Faker::Internet.email,
    fullname: Faker::Name.name,
    password: "password"
  )
  user.save!
end

puts 'Creating 100 fake boats...'
100.times do
  boat = Boat.new(
    name:    Faker::Name.female_first_name,
    description: Faker::TvShows::GameOfThrones.quote,
    location:  "#{Faker::Address.country}, #{Faker::Address.city}",
    price: rand(21..699),
    user: User.all.sample
  )
  boat.save!
end
puts "Finished!"
