require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TaskManager
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0
    smtp = YAML.load_file("#{Rails.root}/config/smtp.yml")

    config.action_mailer.smtp_settings = {
      address: smtp['address'],
      port: smtp['port'],
      authentication: :plain,
      domain: smtp['domain'],
      user_name: smtp['user_name'],
      password: smtp['password'],
      enable_starttls_auto: true
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
