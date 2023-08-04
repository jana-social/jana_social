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
        # require 'pry'; binding.pry
        file_obj = bucket.object(file_path)
        file_obj.upload_file(file.tempfile, acl: "public-read")
        
        user_id = params[:id]
        # require 'pry'; binding.pry
        render json: { data: { profile_image_link: file_obj.public_url } }, status: :ok
        # redirect_to api_v1_user_update_path(user_id: user_id)
    
      rescue StandardError => e
        render json: { error: "Failed to upload file: #{e.message}" }, status: :unprocessable_entity
      end
      
      def new
      end
    end
  end
end
