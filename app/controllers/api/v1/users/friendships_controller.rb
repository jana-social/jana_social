class Api::V1::Users::FriendshipsController < ApplicationController
  def index
    user = User.find(params[:id])
    friends = user.approved_friends
    render json: UserSerializer.new(friends)
  end
end
