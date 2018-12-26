# frozen_string_literal: true

# Require items from Bundler
require 'bundler'
Bundler.require

# Load configuration from file
config_file 'data/config.yml'
config_file 'data/secret.yml'

# Authenticate with TMDb API
TMDb.api_key = settings.tmdb_key

# On '/' page, do this...
get '/' do
  # Open movie file
  File.open('data/movies.json') do |f|
    # Return JSON to the page
    @movies = JSON.parse(f.read)
  end

  # Render views/index.haml
  haml :index
end

get '/search' do
  # Get movie title from query parameters
  query = params['movie']

  # Return result to page
  @result = TMDb::Movie.search(query).first

  # Render views/result.haml
  haml :result
end
