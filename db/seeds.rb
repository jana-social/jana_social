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

user_1 = User.create!(
  username: "Sweet Bread",
  email: "stefanie@jaskolski-sanford.example",
  password: "test",
  zipcode: "80301",
  street_address: "1800 28th St",
  bio: "[\"Five dollar toast sriracha pop-up.\", \"Williamsburg austin mustache kombucha literally ennui pabst.\", \"Umami post-ironic direct trade.\", \"Sustainable diy park seitan pop-up selvage farm-to-table cold-pressed.\", \"Roof yolo blog.\"]",
  likes: "Gentrify roof hoodie mlkshk skateboard.",
  dislikes: "Lo-fi irony you probably haven't heard of them fingerstache tofu."
)

user_2 = User.create!(
  username: "Doughnut",
  email: "carlton.padberg@bogisich.example",
  password: "test",
  zipcode: "80301",
  bio: "[\"Freegan diy fanny pack.\", \"Ethical slow-carb photo booth cardigan.\", \"Seitan williamsburg viral deep v tattooed.\", \"Waistcoat wolf ramps church-key.\", \"Roof cleanse chia pop-up wes anderson.\"]",
  likes: "Tattooed hammock street keytar.",
  dislikes: "Muggle magic everyday selfies humblebrag messenger bag organic listicle swag."
)

user_3 = User.create!(
  username: "Sundae",
  email: "nicholle_stroman@feeney-mraz.test",
  password: "test",
  zipcode: "80303",
  bio: "[\"Distillery cardigan ennui fanny pack ethical tilde taxidermy yr.\", \"Plaid franzen iphone cred.\", \"Squid gentrify wayfarers ethical austin.\", \"Cliche migas kinfolk try-hard hoodie.\", \"Fashion axe helvetica yuccie.\"]",
  likes: "Plaid fashion axe swag carry.",
  dislikes: "Kinfolk umami pitchfork biodiesel deep v."
)

user_4 = User.create!(
  username: "Cheesecake",
  email: "clarence.ullrich@bailey.test",
  password: "test",
  zipcode: "80238",
  bio: "I am Billy!",
  likes: ["walks", "beaches", "beach-walks"],
  dislikes: ["sand", "water", "legs"]
)

user_5 = User.create!(
  username: "Cake Pop",
  email: "jeremiah@grimes.example",
  password: "test",
  zipcode: "79859-1323",
  bio: "[\"Vice leggings post-ironic kombucha organic cronut try-hard master.\", \"Typewriter tilde gentrify meditation.\", \"Cronut master intelligentsia.\", \"Park listicle photo booth trust fund craft beer dreamcatcher seitan.\", \"Chia kombucha craft beer green juice umami tousled flexitarian.\"]",
  likes: "Mixtape 90's muggle magic selfies godard asymmetrical fashion axe schlitz.",
  dislikes: "Williamsburg authentic helvetica polaroid blue bottle waistcoat brooklyn five dollar toast."
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

event_2 = Event.create!(
  title: "Movies For People Who Don't Like Movies",
  description: "It's a walk!",
  street_address: nil,
  zipcode: "23423",
  date_time: "2023-07-29 13:21:50",
  private_status: false,
  latitude: nil,
  longitude: nil,
  user_id: 2
)

event_3 = Event.create!(
  title: "Anotha One",
  description: "It's a walk!",
  street_address: nil,
  zipcode: "23423",
  date_time: "2023-07-29 13:21:50",
  private_status: false,
  latitude: nil,
  longitude: nil,
  user_id: 3
)

event_user_1 = EventUser.create!(
  user_id: 2,
  event_id: 1,
  status: 2
)

event_user_2 = EventUser.create!(
  user_id: 3,
  event_id: 1,
  status: 2
)

event_user_3 = EventUser.create!(
  user_id: 4,
  event_id: 1,
  status: 2
)

event_user_4 = EventUser.create!(
  user_id: 5,
  event_id: 1,
  status: 2
)

event_user_5 = EventUser.create!(
  user_id: 1,
  event_id: 2,
  status: 2
)

event_user_6 = EventUser.create!(
  user_id: 1,
  event_id: 3,
  status: 2
)