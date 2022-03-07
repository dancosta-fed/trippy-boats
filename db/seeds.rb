# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Creating 25 fake users...'

User.create!(fullname: "Fabian Flamengo", email: "fabian@example.com", password: "123456")

25.times do
  user = User.new(
    fullname: Faker::Name.name,
    email: Faker::Internet.email,
    password: "123456"
  )
  user.save!
end

puts 'Creating 100 fake boats...'

100.times do
  boat = Boat.new(
    name: Faker::Name.female_first_name,
    location: "#{Faker::Address.country}, #{Faker::Address.city}",
    description: Faker::Movie.quote,
    price: rand(45..699),
    user_id: rand(1..25)
  )
  boat.save!
end
puts 'Finished!'
