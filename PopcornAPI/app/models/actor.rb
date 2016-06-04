require 'jsonclient'
require 'uri'

class Actor < ApplicationRecord
  has_many :movies, class_name: "ActorMovie"

  def self.find_by_name(name)
    actors = Actor.where(name: name)
    if actors.count == 0
      tmdb_response = search_tmdb(name)
      record = import_actor(tmdb_response["results"][0])
    else
      record = actors.first
    end
    return actor_json(record)
  end

  def self.search_tmdb(query)
    url = "http://api.themoviedb.org/3/search/person?api_key="
    url = url + ENV['MOVIE_API_KEY'] + '&query=' + query
    response = JSONClient.new.get(URI.parse(URI.encode(url))).content
    return response
  end

  def self.import_actor(actor)
    if not actor.nil? and Actor.where(tmdb_id: actor["id"]).count < 1
      record = actor_tmdb(actor["id"].to_s, nil)
      actor_credits = actor_tmdb(actor["id"].to_s, "movie_credits")
      record["movies"] = actor_credits["cast"]
      record = Actor.insert_record(record)
    else
      record = nil
    end
    return record
  end

  def self.actor_tmdb(actor_id, query)
    suffix = ""
    if not query.nil?
      suffix = "/" + query
    end
    query_url = "http://api.themoviedb.org/3/person/" + actor_id + suffix + "?api_key=" + ENV['MOVIE_API_KEY']
    query_response = JSONClient.new.get(URI.parse(URI.encode(query_url))).content
    return query_response
  end

  def self.insert_record(record)
    actor = Actor.new
    actor.name = record["name"]
    actor.imdb_id = record["imdb_id"]
    actor.tmdb_id = record["id"]
    actor.image_path = record["profile_path"]
    prev_entries = ActorMovie.where(actor_id: actor["tmdb_id"])
    record["movies"].each do |movie|
      if prev_entries.where(movie_id: movie["id"]).count < 1
        new_actor_movie = ActorMovie.new
        new_actor_movie.actor_id = actor["tmdb_id"]
        new_actor_movie.movie_id = movie["id"]
        new_actor_movie.save
      end
    end
    actor.save
    return actor
  end

  def self.actor_json(record)
    if not record.nil?
      @json_response = {}
      record.attributes.each do |k, v|
        @json_response[k] = v
      end
      @json_response["movies"] = ActorMovie.where(actor_id: record["tmdb_id"]).pluck(:movie_id)
    end
    return @json_response
  end
end
