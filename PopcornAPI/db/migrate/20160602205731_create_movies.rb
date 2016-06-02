class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :imdb_id
      t.string :tmdb_id
      t.string :image_path

      t.timestamps
    end
  end
end
