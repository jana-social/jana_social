class Api::V1::Users::SearchController < ApplicationController
  def index
    user = User.find(params[:id])
    if params[:distance].present? && params[:distance].to_i > 0
      potential_friends = user.potential_friends_nearby(params[:distance])
      render json: FriendSerializer.new(potential_friends)
    else
      render json: { error: 'No results found' }, status: :not_found
    end
  end
end
