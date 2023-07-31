# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all
Event.destroy_all
EventUser.destroy_all

5.times do |index|
  User.create!(username: Faker::Dessert.variety,
    email: Faker::Internet.email,
    password: "test",
    zipcode: Faker::Address.zip_code,
    street_address: Faker::Address.street_address,
    bio: Faker::Hipster.sentences(number: 5),
    likes: Faker::Hipster.sentence,
    dislikes: Faker::Hipster.sentence,
    profile_image_link: Faker::Internet.url,
    latitude: Faker::Address.latitude,
    longitude: Faker::Address.longitude) 
end

event_1 = Event.create!(
  title: "Movies For People Who Don't Like Movies",
  description: "It's a walk!",
  street_address: "342 Stringer Ln",
  zipcode: "23423",
  date_time: "2023-07-29 13:21:50",
  private_status: true,
  latitude: 34.0522,
  longitude: -118.2437,
  user_id: 1
)

rake db:seed RAILS_ENV=production

