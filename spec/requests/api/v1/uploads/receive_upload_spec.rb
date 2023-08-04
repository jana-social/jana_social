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

        # require 'pry'; binding.pry

        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)).to have_key("data")
        expect(JSON.parse(response.body)["data"]).to have_key("profile_image_link")
        expect(User.first.profile_image_link).to eq(JSON.parse(response.body)[:data][:profile_image_link])
        
      end
    end
  end
end
