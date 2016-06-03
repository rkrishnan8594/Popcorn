class ActorMovie < ApplicationRecord
  belongs_to :actor, foreign_key: :tmdb_id, primary_key: :actor_id
  belongs_to :movie, foreign_key: :tmdb_id, primary_key: :movie_id
end
