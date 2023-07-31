require "rails_helper"

describe "PATCH Update User request" do
  before :each do
    user_data
  end

  it "requests to update an existing user" do
    previous_username = @user1.username
    new_username = "new_name_guy"

    user1_params = {
      user: {
        username: new_username
      }
    }

    headers = { "CONTENT_TYPE" => "application/json" }

    patch "/api/v1/users/#{@user1.id}", headers: headers, params: user1_params.to_json

    user = User.find_by(id: @user1.id)

    expect(response).to be_successful
    expect(user.username).to_not eq(previous_username)
    expect(user.username).to eq(new_username)
  end
end
