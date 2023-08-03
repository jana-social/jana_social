module Api
  module V1
    class UploadsController < ApplicationController
      def index
        @uploads = Upload.all
      end

      # POST /uploads
      def create
        Aws.config.update(access_key_id: ENV["ACCESS_KEY"], secret_access_key: ENV["SECRET_ACCESS_KEY"])
        bucket = Aws::S3::Resource.new.bucket(ENV["BUCKET_NAME"])
        
        require 'pry'; binding.pry
        file = bucket.object(params[:file][:original_filename])
        
        file.upload_file(params[:file][:headers], acl: 'public-read')

        # file.upload_file(params[:file], acl: 'public-read')
        # file.put(acl: "public-read")
        # file.put(params[:file], acl: 'public-read')
        # file.upload_file(file, acl: "public-read")
        
        
        photo = Upload.create(link: file.public_url)
        redirect_to api_v1_users_update_path(photo.profile_image_link)
      end

      def new
      end
    end
  end
end
