require 'rails_helper'

RSpec.describe MoviePerformer, type: :model do
  describe 'relationships' do
    it { should belong_to(:movie) }
    it { should belong_to(:performer) }
  end
end