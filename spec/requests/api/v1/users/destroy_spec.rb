require "rails_helper"

describe "request to Delete User" do
  let!(:user1) { create(:user, street_address: "123 street", zipcode: "87654") }

  it "requests to delete an existing user", vcr: { match_requests_on: [:method, :host, :path] } do
    expect(User.count).to eq(1)

    delete "/api/v1/users/#{user1.id}"

    expect(response).to be_successful
    expect(User.count).to eq(0)
    expect { User.find(user1.id) }.to raise_error(ActiveRecord::RecordNotFound)
  end
end
