require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsAuthentication
  class Application < Rails::Application
    config.generators do |generate|
      generate.assets false
      generate.helper false
      generate.test_framework :test_unit, fixture: false
    end
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    config.paperclip_defaults = {
      storage: :s3,
      s3_host_name: 's3-eu-west-2.amazonaws.com',
      s3_credentials: {
        bucket: 'pauloair',
        access_key_id: 'AKIARDT7LJ56INMPZCUP',
        secret_access_key: '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',
        s3_region: 'eu-west-2'
      }
    }

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
