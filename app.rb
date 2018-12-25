# frozen_string_literal: true

# Require items from Bundler
require 'bundler'
Bundler.require

# Load configuration from file
config_file 'data/config.yml'

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
