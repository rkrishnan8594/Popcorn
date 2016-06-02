class CreateActors < ActiveRecord::Migration[5.0]
  def change
    create_table :actors do |t|
      t.string :name
      t.string :imdb_id
      t.string :image_path

      t.timestamps
    end
  end
end
