require "rails_helper"

RSpec.describe FriendshipSerializer do
  it "should serialize a friendship" do
    user_data
    Friendship.process_friendship(@user1, @user2, :approved)
    friendship = Friendship.find_friendship(@user1, @user2)

    serialized = FriendshipSerializer.new(friendship).to_json

    results = JSON.parse(serialized, symbolize_names: true)

    expect(results[:data]).to have_key(:id)
    expect(results[:data][:id]).to be_a(String)
    expect(results[:data]).to have_key(:type)
    expect(results[:data][:type]).to be_a(String)
    expect(results[:data]).to have_key(:attributes)
    expect(results[:data][:attributes]).to be_a(Hash)
    expect(results[:data][:attributes]).to have_key(:user_id)
    expect(results[:data][:attributes][:user_id]).to be_a(Integer)
    expect(results[:data][:attributes]).to have_key(:friend_id)
    expect(results[:data][:attributes][:friend_id]).to be_a(Integer)
    expect(results[:data][:attributes]).to have_key(:status)
    expect(results[:data][:attributes][:status]).to be_a(String)
  end
end
