require "rails_helper"

describe UserSerializer do
  before(:each) do
    user_params
  end

  it "should not include password data" do
    user = User.create!(@new_user[:user])
    serialized_user = described_class.new(user).as_json

    expect(serialized_user).not_to have_key(:password)
  end
end
