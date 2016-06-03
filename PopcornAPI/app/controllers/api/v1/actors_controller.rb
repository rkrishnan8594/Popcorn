class Api::V1::ActorsController < ApplicationController
  respond_to :json, :html

  def index
    actors = Actor.all
    objects = serialize_actors(actors)
    render json: { actors: objects }
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
