class Api::V1::FriendshipsController < ApplicationController

  # POST /friendships
  def create
    receiver = User.find(params[:friend_id])
    status = params[:status].to_sym
    friendship = Friendship.process_friendship(initiator, receiver, status)
    render json: FriendshipSerializer.new(friendship), status: :created
  end
end