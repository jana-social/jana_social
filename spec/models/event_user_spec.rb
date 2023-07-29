require "rails_helper"

RSpec.describe EventUser, type: :model do

  describe "relationships" do
    it { should belong_to(:event) }
    it { should belong_to(:user) }
  end
end