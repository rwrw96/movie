class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.text :name
      t.text :intro
      t.date :releasedate
      t.string :title

      t.timestamps
    end
  end
end
