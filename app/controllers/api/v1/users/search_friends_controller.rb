class Api::V1::Users::SearchFriendsController < ApplicationController
  def index
    user = User.find(params[:id])
    distance = params[:distance]

    if distance.present? && distance.to_i.positive?
      potential_friends = user.potential_friends_nearby(distance)
      render json: FriendSerializer.new(potential_friends)
    else
      render json: { error: "No results found" }, status: 400
    end
  end
end
