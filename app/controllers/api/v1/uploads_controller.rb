module Api
  module V1
    class UploadsController < ApplicationController
      def index
        @uploads = Upload.all
      end

      def create
        Aws.config.update(access_key_id: ENV['ACCESS_KEY'], secret_access_key: ENV['SECRET_ACCESS_KEY']) 
        bucket = Aws::S3::Resource.new.bucket(ENV['BUCKET_NAME'])    
        
        file = bucket.object(params[:file].original_filename)
      
        file.upload_file(params[:file], acl: 'public-read')
          
        Upload.create(link: file.public_url)
          
        redirect_to api_v1_uploads_path
      end

      def new
      end
    end
  end
end
