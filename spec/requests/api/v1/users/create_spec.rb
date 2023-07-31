require "rails_helper"

describe "POST Create User request" do
  before :each do
    user_params
  end

  it "requests to create a new user" do
    headers = { "CONTENT_TYPE" => "application/json" }

    post "/api/v1/users", headers: headers, params: @new_user.to_json
    created_user = User.last
    expect(response).to have_http_status(:created)

    expect(@new_user[:user][:username]).to eq(created_user.username)
  end
end
