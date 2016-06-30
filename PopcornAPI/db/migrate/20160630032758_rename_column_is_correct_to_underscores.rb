class RenameColumnIsCorrectToUnderscores < ActiveRecord::Migration[5.0]
  def change
    rename_column :turns, :isCorrect, :is_correct
  end
end
