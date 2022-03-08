# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require "open-uri"



# puts 'Creating 2 fake users...'
#
# 2.times do |i|
#   user = User.new(
#     email: "user@#{i + 1}example.com",
#     fullname: Faker::Name.name,
#     password: "password"
#   )
#   user.save!
# end
#
# puts 'Creating 6 fake boats...'
# 6.times do
#   boat = Boat.new(
#     name: Faker::Name.female_first_name,
#     description: Faker::TvShows::GameOfThrones.quote,
#     location:  "#{Faker::Address.country}, #{Faker::Address.city}",
#     price: rand(21..699),
#     user: User.all.sample,
#     photo: "app/assets/images/android-chrome-512x512.png"
#     )
#   boat.save!
# end
#
puts "Adding Mr. Fabio..."
User.create!(fullname: 'Fabio', email: "fabio@gmail.com", password: '123456')

puts "Finished!"
