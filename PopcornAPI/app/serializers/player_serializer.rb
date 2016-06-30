class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :game_id, :username, :strikes, :active
  has_many :turns
  belongs_to :game
  belongs_to :user
end
