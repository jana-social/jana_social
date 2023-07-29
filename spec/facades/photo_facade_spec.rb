require "rails_helper"

RSpec.describe PhotoFacade do 
  it "returns a random photo", :vcr do 
    photo = PhotoFacade.new.get_photo

    expect(photo).to be_a(Photo)
    expect(photo.url).to be_a(String)
  end
end