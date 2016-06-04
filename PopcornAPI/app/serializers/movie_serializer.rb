class MovieSerializer < ActiveModel::Serializer
  attributes :title, :id, :tmdb_id, :imdb_id
  has_many :actors
end
