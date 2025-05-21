require_relative "boot"
require "rails/all"
Bundler.require(*Rails.groups)

module Myapp
  class Application < Rails::Application
    config.load_defaults 7.2
    config.eager_load_paths << Rails.root.join("lib")

    config.generators do |g|
      g.skip_routes true
      g.helper false
      g.test_framework :rspec,
                      fixtures: true,
                      view_specs: false,
                      helper_specs: false,
                      routing_specs: false,
                      controller_specs: true,
                      request_specs: false
      g.fixture_replacement :factory_bot, dir: "spec/factories"
    end

    config.i18n.default_locale = :ja
    config.time_zone = "Tokyo"
  end
end
