require 'rails_helper'

RSpec.describe Performer, type: :model do
  describe 'relationships' do
    it { should have_many :movie_performers }
    it { should have_many(:movies).through(:movie_performers) }
  end
end