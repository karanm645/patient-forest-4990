require 'rails_helper' 

RSpec.describe "Movie Show Page" do 
  before :each do 
    @bollywood = Studio.create!(name: 'Bollywood Studios', location: 'Bollywood')
    @raja = @bollywood.movies.create!(title: 'Raja', creation_year: 2001, genre: 'Comedy')
    @sharukh = @raja.performers.create(name: "Shahrukh Khan", age: 50 )
    @amitabh = @raja.performers.create(name: "Amitabh Bachan", age: 70)
    @kajol = @raja.performers.create(name: "Kajol", age: 20)
    
    @hollywood = Studio.create!(name: 'Hollywood Studios', location: 'Hollywood')
    @barber_shop = @hollywood.movies.create!(title: 'Barber Shop', creation_year: 2004, genre: 'Comedy')
    @ice = @barber_shop.performers.create(name: "Ice Cube", age: 27 )

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

    it 'shows the average age of the performers' do 
      expect(page).to have_content(46.67)
    end 

    it 'does not include performers that are not in the movie' do 
      expect(page).to_not have_content(@ice.name)
    end
  end 

  describe 'i see a form to add an actor to this movie' do 
    it 'can fill in the form with the name of the actor that exists' do 
      fill_in('Name', with: 'Ice Cube')
      click_button "Submit"
      expect(current_path).to eq("/movies/#{@raja.id}")
      expect(page).to have_content(@ice.name)
    end
  end 
end 