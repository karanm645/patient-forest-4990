class MoviesController < ApplicationController 
  def show
    @movie = Movie.find(params[:id])
    @performers = @movie.performers.asc_performers
  end
end 