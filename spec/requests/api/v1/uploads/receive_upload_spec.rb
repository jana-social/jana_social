require "rails_helper"

RSpec.describe "Uploads API", type: :request do

  describe "POST /api/v1/uploads" do
    describe "happy path" do
      it "returns user info with updated AWS profile image link" do
        file_info = "{\"tempfile\":\"#\\u003cFile:0x0000000115838608\\u003e\",\"content_type\":\"image/jpeg\",\"original_filename\":\"shelby-hughes-chonkchilla.jpg\",\"headers\":\"content-disposition: form-data; name=\\\"file\\\"; filename=\\\"shelby-hughes-chonkchilla.jpg\\\"\\r\\ncontent-type: image/jpeg\\r\\ncontent-length: 236098\\r\\n\"}"

        file_data = JSON.parse(file_info)
        file = ActionDispatch::Http::UploadedFile.new(
          tempfile: "/spec/fixtures/files/shelby-hughes-chonkchilla.jpg",
          type: file_data['content_type'],
          filename: file_data['original_filename']
          )
          
  require 'pry'; binding.pry
        post "/api/v1/uploads", params: { id: "1", file: file }

        expect(response).to be_successful
        expect(response.status).to eq(200)
        updated_user = JSON.parse(response.body, symbolize_names: true)

        expect(updated_user[:data]).to eq(1)
        expect(updated_user[:data][:profile_image_link]).to eq("")
        
      end
    end
  end
end
