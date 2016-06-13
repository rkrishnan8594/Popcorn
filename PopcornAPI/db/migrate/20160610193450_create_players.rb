class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.references :user, foreign_key: true
      t.references :game, foreign_key: true
      t.integer :strikes
      t.boolean :active

      t.timestamps
    end
  end
end
