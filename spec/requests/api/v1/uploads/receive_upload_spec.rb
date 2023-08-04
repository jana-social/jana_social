require "rails_helper"

RSpec.describe "Uploads API", type: :request do

  describe "POST /api/v1/uploads" do
    describe "happy path" do
      before :each do
        user_data
      end

      it "returns user info with updated AWS profile image link" do
        
        file = fixture_file_upload("spec/fixtures/files/shelby-hughes-chonkchilla.jpg", "image/jpeg")
        
        post "/api/v1/uploads", params: { id: User.first.id, file: file }
        
        expect(response).to have_http_status(:accepted)

        updated_user = JSON.parse(response.body, symbolize_names: true)
        
        expect(updated_user).to have_key(:data)
        expect(updated_user[:data]).to have_key(:attributes)

        expect(updated_user[:data][:attributes]).to have_key(:profile_image_link)
        expect(updated_user[:data][:attributes][:profile_image_link]).to include("amazonaws.com")
      end
    end
  end
end
