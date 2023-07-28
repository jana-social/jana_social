require "rails_helper"

RSpec.describe PhotoFacade do 
  it "returns a random photo", :vcr do 
    photo = PhotoFacade.new.get_photo
require 'pry'; binding.pry
    expect(photo).to be_a(Hash)
    expect(photo[:urls][:raw]).to be_a(String)
  end
end