module Api
  module V1
    class RoomsController < ApplicationController
      def index
        @current_user = current_user
        redirect_to '/signin' unless @current_user
        @rooms = Room.all
        @users = User.all
      end
    end
  end
end
