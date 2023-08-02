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

# <<<<<<<<< Temporary merge branch 1
user_1 = User.create!(
  username: "Billy Villian",
  email: "billsvills@gmail.com",
  password: "test",
  zipcode: "32492",
  street_address: nil,
  bio: "I am Billy!",
  likes: ["walks", "beaches", "beach-walks"],
  dislikes: ["sand", "water", "legs"],
  profile_image_link: "https://unsplash.com/photos/aQSPWSxCweY",
  latitude: nil,
  longitude: nil
)


event_1 = Event.create!(
  title: "Movies For People Who Don't Like Movies",
  description: "It's a walk!",
  street_address: nil,
  zipcode: "23423",
  date_time: "2023-07-29 13:21:50",
  private_status: true,
  latitude: nil,
  longitude: nil,
  user_id: 1
)

# rake db:seed RAILS_ENV=production

