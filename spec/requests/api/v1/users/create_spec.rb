require "rails_helper"

describe "POST Create User request" do
  before :each do
    user_params
  end

  it "requests to create a new user", :vcr do
    headers = { "CONTENT_TYPE" => "application/json" }

    post "/api/v1/users", headers: headers, params: @new_user.to_json
    created_user = User.last
    expect(response).to have_http_status(:created)

    expect(@new_user[:user][:username]).to eq(created_user.username)
  end

  it "assigns a random default profile picture when a new user is created", :vcr do
    headers = { "CONTENT_TYPE" => "application/json" }

    new_params = {
      user: {
        username: Faker::Dessert.variety,
        email: Faker::Internet.email,
        password: Faker::Internet.password,
        zipcode: "80212",
        street_address: "4505 Tennyson St",
        bio: Faker::Hipster.sentences(number: 2),
        likes: Faker::Hipster.sentence,
        dislikes: Faker::Hipster.sentence
      }
    }

    post "/api/v1/users", headers: headers, params: new_params.to_json
    created_user = User.last

    expect(created_user.profile_image_link).to_not be(nil)
  end
end
