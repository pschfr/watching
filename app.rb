# frozen_string_literal: true

# Require items from Bundler
require 'bundler'
Bundler.require

# On '/' page, do this...
get '/' do
  haml :index
end
