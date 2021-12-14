require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'relationships' do
    it { should belong_to(:studio) }
    it { should have_many :movie_performers}
    it { should have_many(:performers).through(:movie_performers) }
  end
end
