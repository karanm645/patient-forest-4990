class MoviePerformer < ApplicationRecord 
  belongs_to :movie 
  belongs_to :performer
end 