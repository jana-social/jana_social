# require 'rails_helper'

# describe UserSerializer do
#   it "should not include password data" do
#     VCR.use_cassette("openstreetmap_api") do

#       user = create(:user, password: "secret_password")
#       serialized_user = described_class.new(user).as_json
#       expect(serialized_user).not_to have_key(:password)
#     end
#   end
# end