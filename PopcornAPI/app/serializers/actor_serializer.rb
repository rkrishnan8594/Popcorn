class ActorSerializer < ActiveModel::Serializer
  attributes :name, :id, :imdb_id, :tmdb_id
  has_many :movies
end
