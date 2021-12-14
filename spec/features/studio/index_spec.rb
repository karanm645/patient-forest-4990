require 'rails_helper' 

RSpec.describe "Studio Index Page" do 
  before :each do 
    @universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    @bollywood = Studio.create!(name: 'Bollywood Studios', location: 'Bombay')

    visit "/studios"
  end 
  describe 'as a visitor' do
    it 'shows each studio/s name and location' do 
      expect(page).to have_content(@universal.name)
      expect(page).to have_content(@universal.location)
      expect(page).to have_content(@bollywood.name)
      expect(page).to have_content(@universal.location)
    end
  end 
end 