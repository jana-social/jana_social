module Api
  module V1
    class SearchController < ApplicationController
      def find
        user = User.find_by(email: params[:q])
        if user&.authenticate(params[:p])
          render json: UserSerializer.new(user)
        else
          render json: { errors: ["Invalid username or password"] }, status: :unauthorized
        end
      end
    end
  end
end
