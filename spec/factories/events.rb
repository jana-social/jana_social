FactoryBot.define do
  factory :event do
    title { Faker::Space.nebula }
    description { Faker::Hipster.paragraph }
    date_time { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
    zipcode { Faker::Address.zip_code }
    street_address { Faker::Address.street_address }
    private_status { false }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
  end
end
