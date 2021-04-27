class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.text :title
      t.string :release_date
      t.text :overview
      t.text :poster_path
      t.date :releasedate
      t.integer :tmdb
      t.timestamps
    end
  end
end
