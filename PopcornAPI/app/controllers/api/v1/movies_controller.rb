class Api::V1::MoviesController < ApplicationController
  respond_to :json, :html

  def index
    movies = Movie.all
    render json: movies
  end

  def find
    movie = Movie.find_by_title(params[:title])
    render json: movie
  end

  private

  def serialize(movies)
    objects = []
    movies.each do |movie|
      object = {}
      movie.attributes.each do |k, v|
        object[k] = v
      end
      object["actors"] = ActorMovie.where(actor_id: actor["tmdb_id"]).pluck(:actor_id)
      objects << object
    end
    return objects
  end
end
