class TurnSerializer < ActiveModel::Serializer
  attributes :id, :type, :answer, :isCorrect, :player_id, :game_id
end
