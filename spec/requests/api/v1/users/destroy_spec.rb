require "rails_helper"

describe "request to Delete User" do
  before :each do
    user_data
  end

  it "requests to delete an existing user" do
    expect(User.count).to eq(4)

    delete "/api/v1/users/#{@user1.id}"

    expect(response).to be_successful
    expect(User.count).to eq(3)
    expect { User.find(@user1.id) }.to raise_error(ActiveRecord::RecordNotFound)
  end
end
