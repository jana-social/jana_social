module Api
  module V1
    class UsersController < ApplicationController
      before_action :set_user, only: %i[show update destroy]

      # GET /users
      def index
        @users = User.all

        render json: UserSerializer.new(@users)
      end

      # GET /users/1
      def show
        render json: UserSerializer.new(@user)
      end

      # POST /users
      def create
        @user = User.new(user_create_params)
        @photo = PhotoFacade.new.get_photo
        @user.update(profile_image_link: @photo.url)
        if @user.save
          render json: UserSerializer.new(@user), status: :created
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /users/1
      def update
        if @user.update(user_params)
          render json: UserSerializer.new(@user), status: :accepted
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      # DELETE /users/1
      def destroy
        render json: User.delete(@user)
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = User.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def user_params
        params.require(:user).permit(
          :username,
          :email,
          :password,
          :zipcode,
          :street_address,
          :bio,
          :likes,
          :dislikes,
          :profile_image_link,
          :latitude,
          :longitude
        )
      end

      def user_create_params
        params.permit(:username, :email, :password, :zipcode)
      end
    end
  end
end
