require "rails_helper"

describe "POST Create User request" do
  before :each do
    user_params_data
  end

  it "requests to create a new user" do
    headers = { "CONTENT_TYPE" => "application/json" }

    post "/api/v1/users", headers: headers, params: @new_user.to_json
    created_user = User.last
    expect(response).to have_http_status(:created)

    expect(@new_user[:username]).to eq(created_user.username)
  end

  it "assigns a random default profile picture when a new user is created", :vcr do
    headers = { "CONTENT_TYPE" => "application/json" }

    new_params = {
      username: Faker::Dessert.variety,
      email: Faker::Internet.email,
      password: Faker::Internet.password,
      zipcode: "80212"
    }

    post "/api/v1/users", headers: headers, params: new_params.to_json
    created_user = User.last

    expect(created_user.profile_image_link).to_not be(nil)
  end
end
