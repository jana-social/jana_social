require "rails_helper"

RSpec.describe "Create Friendship API" do
  let!(:user_1) { create(:user, username: "Foo", zipcode: "92315", email: "foo@gmail.com", password_digest: "test123") }
  let!(:user_2) { create(:user, username: "Barr",  zipcode: "92315", email: "barr@gmail.com", password_digest: "test123") }
  
  describe "/api/v1/users/:user_id/friendships" do
    it "can create a new friendship api", :vcr do
      require 'pry'; binding.pry
    end
  end
end