require "rails_helper"

describe "User show request" do
  let!(:user_1) { create(:user) }

  it "requests a specific user", vcr: { match_requests_on: [:method, :host, :path] } do
    get "/api/v1/users/#{user_1.id}"
    expect(response).to be_successful

    user = JSON.parse(response.body, symbolize_names: true)
    expect(user[:data][:id].to_i).to eq(user_1.id)
  end
end
