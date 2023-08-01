class Api::V1::Users::SearchController < ApplicationController
  def index
    if params[:distance].present?
      users = User.potential_friends_nearby(params[:distance])
      render json: FriendSerializer.new(users)
    else
      render json: { error: 'No results found' }, status: :not_found
    end
  end
end
