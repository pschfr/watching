# frozen_string_literal: true

# Require items from Bundler
require 'bundler'
Bundler.require

# Load configuration from file
config_file 'data/config.yml'

# Constants
IMAGE_PATH    = 'https://image.tmdb.org/t/p/w500'
MOVIE_PATH    = 'data/movies.json'
POSTER_PATH   = 'data/posters.json'

# Authenticate with TMDb API
TMDb.api_key = settings.tmdb_key

# On '/' page, do this...
get '/' do
  # Open movie file, and return JSON to the page
  File.open(MOVIE_PATH) do |f|
    @movies = JSON.parse(f.read).sort_by { |e| e[0].to_s }
  end
  # Open poster file, and return JSON to the page
  File.open(POSTER_PATH) do |f|
    @posters = JSON.parse(f.read).sort_by { |e| e.keys[0].to_s }
  end

  # Render views/index.haml
  haml :index
end

# On '/search?movie=title' or '/add?movie=title', do this...
get ['/search', '/add'] do
  # Get movie title from query parameters
  query = params['movie']

  # Return result to page
  @result = TMDb::Movie.search(query).first

  # If on '/add', actually add the poster path to the JSON file
  if request.path_info == '/add'
    # Builds temporary hashes for storing the images
    poster_hash   = { @result.title => "#{IMAGE_PATH}#{@result.poster_path}" }

    # Opens JSON file for reading
    poster_json   = JSON[File.read(POSTER_PATH)]
    poster_json   = [poster_json] if poster_json.class != Array

    # Append hash to JSON file
    File.open(POSTER_PATH, 'w') do |f|
      f.write(JSON.pretty_generate(poster_json << poster_hash))
    end
  end

  # Render views/result.haml
  haml :result
end
