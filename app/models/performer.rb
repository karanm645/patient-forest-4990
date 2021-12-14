class Performer < ApplicationRecord
  has_many :movie_performers
  has_many :movies, through: :movie_performers

  def self.asc_performers
    order(:age)
  end

  def self.average_performer_age 
    average(:age).round(2)
  end
end