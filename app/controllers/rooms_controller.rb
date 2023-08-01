# module Api
#   module V1
    class RoomsController < ApplicationController
      def index
        @current_user = current_user
        @rooms = Room.all
        @users = User.all
        render json: RoomSerializer.new(@rooms)
        require 'pry'; binding.pry
        redirect_to '/signin' unless @current_user
      end
    end
#   end
# end
