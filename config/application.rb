require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Railsapp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.i18n.default_locale = :ja

    config.assets.precompile += ['chapan.css']

    #    config.colorize_logging = false

    config.time_zone = 'Tokyo'
    config.generators do |g|
      g.helper false
      g.assets false
      g.test_framework :rspec, fixture: true
      g.fixture_replacement :factory_bot, dir: "spec/factories"
      g.controller_specs false
      g.view_specs false
    end
    config.active_record.default_timezone = :local
  end
end
