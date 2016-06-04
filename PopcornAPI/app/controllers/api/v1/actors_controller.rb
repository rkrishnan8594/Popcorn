class Api::V1::ActorsController < ApplicationController
  respond_to :json, :html

  def index
    actors = Actor.all
    render json: actors
  end

  def find
    actor = Actor.find_by_name(params[:name])
    render json: actor
  end

  private

  def serialize(actors)
    objects = []
    actors.each do |actor|
      object = {}
      actor.attributes.each do |k, v|
        object[k] = v
      end
      object["movies"] = ActorMovie.where(actor_id: actor["tmdb_id"]).pluck(:movie_id)
      objects << object
    end
    return objects
  end
end
