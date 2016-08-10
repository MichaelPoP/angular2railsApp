require_relative 'boot'

require 'rails/all'

# THE FOLLOWING TUTORIAL IS ABSOLUTELY NECESSARY
# http://tutorials.pluralsight.com/ruby-ruby-on-rails/react-vs-angular-2-integration-with-rails
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Angular2app
  class Application < Rails::Application
  	#...
  	config.middleware.insert_before 0, 'Rack::Cors' do
  		allow do
  			origins '*'
  			resource '*', :headers => :any, :methods => [:get, :post, :options]
  		end
  	end

  	#explicitly adding the node_modules directory to assets
  	config.assets.paths << Rails.root.join('node_modules')
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end


