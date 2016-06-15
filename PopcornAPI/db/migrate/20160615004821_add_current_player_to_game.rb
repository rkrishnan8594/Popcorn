class AddCurrentPlayerToGame < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :current, :integer
  end
end
