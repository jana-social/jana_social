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

<<<<<<<<< Temporary merge branch 1
user_1 = User.create!(
  username: "Billy Villian",
  email: "billsvills@gmail.com",
  password: "test",
  zipcode: "32492",
  street_address: "324 Blickford Drive",
  bio: "I am Billy!",
  likes: ["walks", "beaches", "beach-walks"],
  dislikes: ["sand", "water", "legs"],
  profile_image_link: "https://example.com/profiles/billy.jpg",
  latitude: 40.7185,
  longitude: -74.0056
)


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

