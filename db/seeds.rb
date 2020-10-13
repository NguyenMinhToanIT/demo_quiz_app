# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Create a main sample user
User.create!(
  name: "Example User",
  email: "example@railstutorial.org",
  password: "123",
  password_confirmation: "123",
  admin: true,
  activated: true,
  activated_at: Time.zone.now
)
#Generate a bunch of addtional users
40.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@railstutorials.org"
  password = "123"
  User.create!(
    name: name,
    email: email,
    password: password,
    password_confirmation: password,
    activated: true,
    activated_at: Time.zone.now
  )
end