module Api
  module V1
    class SearchController < ApplicationController
      def find
        user = User.find_by(email: params[:q])
        if user&.authenticate(params[:p])
          # session[:user_id] = user.id
          render json: user
        else
          render json: { errors: ["Invalid username or password"] }, status: :unauthorized
        end
        # user = User.search_by_email(params[:q])
        # if user.auth
        # render json: UserSerializer.new(user)
      end
    end
  end
end
