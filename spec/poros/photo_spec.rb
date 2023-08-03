require "rails_helper"

RSpec.describe Photo do
  it "exists and has attributes" do
    data = {
      urls: {
        thumb: "https://images.unsplash.com/photo-1690184432588-81068877d852?ixid=M3w0ODE0Nzl8MHwxfHJhbmRvbXx8fHx8fHx8fDE2OTA1ODExMzF8&ixlib=rb-4.0.3"
      }
    }

    photo = Photo.new(data)

    expect(photo).to be_a(Photo)
    expect(photo.url).to be_a(String)
  end
end
