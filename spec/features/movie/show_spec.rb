require 'rails_helper' 

RSpec.describe "Movie Show Page" do 
  before :each do 
    @bollywood = Studio.create!(name: 'Bollywood Studios', location: 'Bollywood')
    @raja = @bollywood.movies.create!(title: 'Raja', creation_year: 2001, genre: 'Comedy')
    @sharukh = @raja.performers.create(name: "Shahrukh Khan", age: 50 )
    @amitabh = @raja.performers.create(name: "Amitabh Bachan", age: 70)
    @kajol = @raja.performers.create(name: "Kajol", age: 20)

    visit "/movies/#{@raja.id}"
  end 
  describe 'when i visit the movies show page' do
    it 'shows the movies attributes' do 
      expect(page).to have_content(@raja.title)
      expect(page).to have_content(@raja.creation_year)
      expect(page).to have_content(@raja.genre)
    end

    it 'has a list of all performers from youngest to oldest' do 
      expect(@sharukh.name).to appear_before(@amitabh.name)
      expect(@kajol.name).to appear_before(@sharukh.name)
    end 

    xit 'shows the average age of the performers' do 
      expect(page).to have_content(60)
    end 
  end 
end 