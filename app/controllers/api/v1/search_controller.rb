module Api
  module V1
    class SearchController < ApplicationController
      def find
        # user = User.search_by_email(params[:q])
        # render json: UserSerializer.new(user)
        require 'pry'; binding.pry
        user = User.find_by(username: params[:username])
        if user&.authenticate(params[:password])
          session[:user_id] = user.id
          render json: user
        else
          render json: { errors: ["Invalid username or password"] }, status: :unauthorized
        end
      end

    #   def create
    #     user = User.find_by(username: params[:username])
    #     if user&.authenticate(params[:password])
    #       session[:user_id] = user.id
    #       render json: user
    #     else
    #       render json: { errors: ["Invalid username or password"] }, status: :unauthorized
    #     end
    # end
  end
end
