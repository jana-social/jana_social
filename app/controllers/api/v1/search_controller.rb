module Api
  module V1
    class SearchController < ApplicationController
      def find
        user = User.search_by_email(params[:q])
        render json: UserSerializer.new(user)
      end
    end
  end
end
