require "rails_helper"

RSpec.describe "Uploads API", type: :request do

  describe "POST /api/v1/uploads" do
    describe "happy path" do
      it "returns user info with updated AWS profile image link" do
        post "/api/v1/uploads", { id: "1", filename: "shelby-hughes-chonkchilla.jpg" }

        expect(response).to be_successful
        expect(response.status).to eq(200)
require 'pry'; binding.pry
        updated_user = JSON.parse(response.body, symbolize_names: true)

        expect(updated_user[:data]).to eq(1)

        
      end
    end
  end
end
