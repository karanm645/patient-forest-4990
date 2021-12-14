class Movie < ApplicationRecord
  belongs_to :studio
  has_many :movie_performers
  has_many :performers, through: :movie_performers
end
