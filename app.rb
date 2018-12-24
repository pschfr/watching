# frozen_string_literal: true

# Require items from Bundler
require 'bundler'
Bundler.require

# Sets default layout to layout.haml
set :haml, :layout => :layout

# On '/' page, do this...
get '/' do
  haml :index
end
