class MoviesController < ApplicationController 
  def show
    @movie = Movie.find(params[:id])
    @performers = @movie.performers.asc_performers
  end

  def update 
    
    @performers = Performer.find(params[:id])
    @movies = Movie.find(params[:id])
    redirect_to "/movies/#{@movies.id}"
  end
end 