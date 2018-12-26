require_relative 'app'
require_relative 'lib/assets'

map '/assets' do
  run Assets.environment Sinatra::Application.settings.root
end

run Sinatra::Application
