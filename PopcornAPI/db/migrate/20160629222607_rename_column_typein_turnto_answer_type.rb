class RenameColumnTypeinTurntoAnswerType < ActiveRecord::Migration[5.0]
  def change
    rename_column :turns, :type, :answer_type
  end
end
