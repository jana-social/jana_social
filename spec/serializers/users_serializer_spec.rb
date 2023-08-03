require "rails_helper"

describe UserSerializer do
  before(:each) do
    user_params_data
  end

  it "should not include password data", :vcr do
    user = User.create!(@new_user)
    serialized_user = described_class.new(user).as_json

    expect(serialized_user).not_to have_key(:password)
  end
end
