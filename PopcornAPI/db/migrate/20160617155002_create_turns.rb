class CreateTurns < ActiveRecord::Migration[5.0]
  def change
    create_table :turns do |t|
      t.references :player, foreign_key: true
      t.references :game, foreign_key: true
      t.string :type
      t.string :answer
      t.boolean :isCorrect

      t.timestamps
    end
  end
end
