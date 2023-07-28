# module Api
#   module V1
#     class UsersController < ApplicationController
#       before_action :set_user, only: %i[show update destroy]

#       # GET /users
#       def index
#         @users = User.all

#         render json: @users
#       end

#       # GET /users/1
#       def show
#         render json: @user
#       end

#       # POST /users
#       def create
#         @user = User.new(user_params)

#         if @user.save
#           render json: @user, status: :created, location: @user
#         else
#           render json: @user.errors, status: :unprocessable_entity
#         end
#       end

#       # PATCH/PUT /users/1
#       def update
#         if @user.update(user_params)
#           render json: @user
#         else
#           render json: @user.errors, status: :unprocessable_entity
#         end
#       end

#       # DELETE /users/1
#       def destroy
#         @user.destroy
#       end

#       private

#       # Use callbacks to share common setup or constraints between actions.
#       def set_user
#         @user = User.find(params[:id])
#       end

#       # Only allow a list of trusted parameters through.
#       def user_params
#         params.require(:user).permit(:username, :email, :password_digest, :zipcode, :street_address, :bio, :likes, :dislikes, :profile_image_link, :latitude, :longitude)
#       end
#     end
#   end
# end


module Api
  module V1
    class UsersController < ApplicationController
      before_action :set_user, only: %i[show update destroy]

      # GET /users
      def index
        @users = User.all

        render json: UserIndexSerializer.new(@users)
      end

      # GET /users/1
      def show
        render json: UserShowSerializer.new(@user)
      end

      # POST /users
      def create
        @user = User.new(user_params)

        if @user.save
          render json: UserCreateSerializer.new(User.create(user_params)), status: :created
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /users/1
      def update
        if @user.update(user_params)
          render json: UserUpdateSerializer.new(@user), status: :accepted
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
        params.require(:user).permit(:username, :email, :password_digest, :zipcode, :street_address, :bio, :likes, :dislikes, :profile_image_link, :latitude, :longitude)
      end
    end
  end
end
