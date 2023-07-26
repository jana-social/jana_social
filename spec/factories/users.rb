FactoryBot.define do
  factory :user do
    username { Faker::Dessert.variety }
    email { Faker::Internet.email }
    password_digest { Faker::Internet.password }
    zipcode { Faker::Address.zip_code }
    street_address { Faker::Address.street_address }
    bio { Faker::Hipster.sentences(number: 5) }
    likes { Faker::Hipster.sentence }
    dislikes { Faker::Hipster.sentence }
    profile_image_link { Faker::Internet.url }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
  end
end
