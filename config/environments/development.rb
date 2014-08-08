Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  # Required for Devise mailer
  config.action_mailer.default_url_options = { host: ENV["API_BASE_URL"] }

  # Raise an exception if there is an error when sending an email
  config.action_mailer.raise_delivery_errors = true

  # Email configuration settings
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address:              ENV["EMAIL_SERVER"],
    port:                 587,
    domain:               ENV["EMAIL_DOMAIN"],
    user_name:            ENV["EMAIL_USERNAME"],
    password:             ENV["EMAIL_PASSWORD"],
    authentication:       'plain',
    enable_starttls_auto: true
  }
end
