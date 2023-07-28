require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many(:friendships).dependent(:destroy) }
    it { should have_many(:friends).through(:friendships) }
  end
end

