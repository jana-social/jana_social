require "rails_helper"

describe UserSerializer do
  it "should not include password data" do
    VCR.use_cassette("openstreetmap_api") do
      user = User.create!(
        username: "Foo",
        zipcode: "80203",
        street_address: "505 E Colfax Ave",
        email: "foo@gmail.com",
        password: "test123"
      )

      serialized_user = described_class.new(user).as_json
      expect(serialized_user).not_to have_key(:password)
    end
  end
end
