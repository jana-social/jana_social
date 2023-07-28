require "rails_helper"

describe "POST Create User request" do    
  it "requests to create a new user", vcr: { match_requests_on: [:method, :host, :path] } do
    user_params = {
      user: {
        username: Faker::Dessert.variety,
        email: Faker::Internet.email,
        password_digest: Faker::Internet.password,
        zipcode: Faker::Address.zip_code,
        street_address: Faker::Address.street_address,
        bio: Faker::Hipster.sentences(number: 5),
        likes: Faker::Hipster.sentence,
        dislikes: Faker::Hipster.sentence,
        profile_image_link: Faker::Internet.url,
        latitude: Faker::Address.latitude,
        longitude: Faker::Address.longitude
      }
    }
    headers = { "CONTENT_TYPE" => "application/json" }

    post "/api/v1/users", headers: headers, params: user_params.to_json

    created_user = User.last
    expect(response).to have_http_status(:created)

    expect(user_params[:user][:username]).to eq(created_user.username)
  end
end
