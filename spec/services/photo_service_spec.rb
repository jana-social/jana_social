require "rails_helper"

RSpec.describe "photo service" do 
  it "returns a random photo", :vcr do
    search = PhotoService.new.random_photo

    expect(search).to be_a(Hash)
    expect(search).to have_key(:urls)
    expect(search[:urls]).to be_a(Hash)
    expect(search[:urls]).to have_key(:raw)
    expect(search[:urls][:raw]).to be_a(String)
  end
end
