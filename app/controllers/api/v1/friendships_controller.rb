class Api::V1::FriendshipsController < ApplicationController
  def create
    initiator = User.find(params[:user_id])
    receiver = User.find(params[:friend_id])
    status = params[:status].to_sym

    Friendship.process_friendship(initiator, receiver, status)
    friendship = Friendship.find_friendship(initiator, receiver)
    render json: FriendshipSerializer.new(friendship), status: :created
  end
end