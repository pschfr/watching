# frozen_string_literal: true

# Require items from Bundler
require 'bundler'
Bundler.require

# Load configuration from file
config_file 'data/config.yml'

# On '/' page, do this...
get '/' do
  haml :index
end
