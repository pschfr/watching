# Sets up Sprockets
module Assets
  def self.environment(root_path)
    environment = Sprockets::Environment.new root_path
    environment.append_path 'assets'
    environment.append_path 'vendor/bundle/gems/'
    environment
  end
end
