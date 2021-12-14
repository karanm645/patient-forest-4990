class CreateMoviePerformers < ActiveRecord::Migration[5.2]
  def change
    create_table :movie_performers do |t|
      t.references :movie, foreign_key: true
      t.references :performer, foreign_key: true

      t.timestamps
    end
  end
end
