require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'relationships' do
    it { should belong_to(:studio) }
    it { should have_many :movie_performers}
    it { should have_many(:performers).through(:movie_performers) }
  end
  
  before :each do 
    @bollywood = Studio.create!(name: 'Bollywood Studios', location: 'Bollywood')
    @raja = @bollywood.movies.create!(title: 'Raja', creation_year: 2001, genre: 'Comedy')
    @sharukh = @raja.performers.create(name: "Shahrukh Khan", age: 50 )
    @amitabh = @raja.performers.create(name: "Amitabh Bachan", age: 70)
    @kajol = @raja.performers.create(name: "Kajol", age: 20)
  end 

  describe 'class methods' do
    it '.asc_performers' do 
      expect(Performer.asc_performers).to eq([@kajol, @sharukh, @amitabh])
    end 

    it '.average_performer_age' do 
      expect(Performer.average_performer_age).to eq(46.67)
    end 
  end 
end
