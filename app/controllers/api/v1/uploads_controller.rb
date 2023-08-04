module Api
  module V1
    class UploadsController < ApplicationController
      def index
        @uploads = Upload.all
      end

      def create
        Aws.config.update(access_key_id: ENV["ACCESS_KEY"], secret_access_key: ENV["SECRET_ACCESS_KEY"])
        bucket = Aws::S3::Resource.new.bucket(ENV["BUCKET_NAME"])

        file = params[:file] # The file parameter will be an instance of ActionDispatch::Http::UploadedFile

        # Upload the file to AWS S3 bucket
        file_path = "uploads/#{SecureRandom.uuid}/#{file.original_filename}"
        file_obj = bucket.object(file_path)
        file_obj.upload_file(file.tempfile, acl: "public-read")

        photo = Upload.create(link: file_obj.public_url)

        render json: { data: { profile_image_link: photo.link } }, status: :ok
      rescue StandardError => e
        render json: { error: "Failed to upload file: #{e.message}" }, status: :unprocessable_entity
      end
      
      def new
      end
    end
  end
end
