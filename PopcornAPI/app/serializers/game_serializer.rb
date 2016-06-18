class GameSerializer < ActiveModel::Serializer
  attributes :id, :name, :current
  has_many :players
  has_many :turns
end
