class TurnSerializer < ActiveModel::Serializer
  attributes :id, :answer_type, :answer, :is_correct, :player_id, :game_id
  belongs_to :player
  belongs_to :game
end
