class AddTmdbIdToActors < ActiveRecord::Migration[5.0]
  def change
    add_column :actors, :tmdb_id, :string
  end
end
