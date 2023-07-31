require "rails_helper"

describe "User show request" do
  before :each do
    user_data
  end

  it "requests a specific user" do
    get "/api/v1/users/#{@user1.id}"
    expect(response).to be_successful

    user = JSON.parse(response.body, symbolize_names: true)
    expect(user[:data][:id].to_i).to eq(@user1.id)
  end
end
