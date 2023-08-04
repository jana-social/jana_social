module Api
  module V1
    class UploadsController < ApplicationController
      def index
        @uploads = Upload.all
      end

      def create
        Aws.config.update(access_key_id: ENV["ACCESS_KEY"], secret_access_key: ENV["SECRET_ACCESS_KEY"])
        bucket = Aws::S3::Resource.new.bucket(ENV["BUCKET_NAME"])

        file = params[:file]
        file_path = "uploads/#{SecureRandom.uuid}/#{file.original_filename}"

        file_obj = bucket.object(file_path)
        file_obj.upload_file(file.tempfile, acl: "public-read")
        
        @user = User.find(params[:id])
      
        if @user.update(profile_image_link: file_obj.public_url)
          render json: UserSerializer.new(@user), status: :accepted
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end
    end
  end
end
