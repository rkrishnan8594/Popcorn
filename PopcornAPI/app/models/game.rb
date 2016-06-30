class Game < ApplicationRecord
  has_many :players
  has_many :users, through: :players
  has_many :turns
end
