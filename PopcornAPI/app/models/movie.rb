require 'jsonclient'
require 'uri'

class Movie < ApplicationRecord
  has_many :actors, class_name: "ActorMovie"

  def self.find_by_title(title)
    movies = Movie.where(title: title)
    if movies.count == 0
      tmdb_response = search_tmdb(title)
      record = import_movie(tmdb_response["results"][0])
    else
      record = movies.first
    end
    return movie_json(record)
  end

  def self.search_tmdb(query)
    url = "http://api.themoviedb.org/3/search/movie?api_key=" + ENV['MOVIE_API_KEY'] + '&query=' + query
    response = JSONClient.new.get(URI.parse(URI.encode(url))).content
    return response
  end

  def self.import_movie(movie)
    if movie.nil?
      record = nil
    else
      movie_id = movie["id"].to_s
      record = Movie.movie_tmdb(movie_id, nil)
      movie_cast = Movie.movie_tmdb(movie_id, "credits")
      record["actors"] = movie_cast["cast"]
      record = Movie.insert_record(record)
    end
    return record
  end

  def self.movie_tmdb(movie_id, query)
    suffix = ""
    if not query.nil?
      suffix = "/" + query
    end
    url = "http://api.themoviedb.org/3/movie/" + movie_id + suffix + "?api_key=" + ENV['MOVIE_API_KEY']
    response = JSONClient.new.get(URI.parse(URI.encode(url))).content
    return response
  end

  def self.insert_record(record)
    movie = Movie.new
    movie.title = record["title"]
    movie.imdb_id = record["imdb_id"]
    movie.tmdb_id = record["id"]
    movie.image_path = record["poster_path"]
    prev_entries = ActorMovie.where(movie_id: movie["tmdb_id"])
    record["actors"].each do |actor|
      if prev_entries.where(actor_id: actor["id"]).count < 1
        new_actor_movie = ActorMovie.new
        new_actor_movie.actor_id = actor["id"]
        new_actor_movie.movie_id = record["id"]
        new_actor_movie.save
      end
    end
    movie.save
    return movie
  end

  def self.movie_json(record)
    @json_response = {}
    if not record.nil?
      record.attributes.each do |k, v|
        @json_response[k] = v
      end
      @json_response["actors"] = ActorMovie.where(movie_id: record["tmdb_id"]).pluck(:actor_id)
    end
    return @json_response
  end
end
