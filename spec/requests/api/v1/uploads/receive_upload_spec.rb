require "rails_helper"

RSpec.describe "Uploads API", type: :request do

  describe "POST /api/v1/uploads" do
    describe "happy path" do
      it "returns user info with updated AWS profile image link" do

        file = fixture_file_upload("spec/fixtures/files/shelby-hughes-chonkchilla.jpg", "image/jpeg")


        post "/api/v1/uploads", params: { id: "1", file: file }
        # require 'pry'; binding.pry

        expect(response).to be_successful
        expect(response.status).to eq(200)
      

        
      end
    end
  end
end
