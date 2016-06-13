class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :game_id, :strikes, :active
end
