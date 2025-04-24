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
      g.test_framework nil
      g.system_tests nil
    end

    config.i18n.default_locale = :ja
    config.time_zone = "Tokyo"
  end
end
