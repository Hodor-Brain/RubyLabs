Rails.application.configure do
  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?
  config.eager_load = true
  config.assets.compile = false

  if ENV["RAILS_LOG_TO_STDOUT"].present?
    logger = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger = ActiveSupport::TaggedLogging.new(logger)
  end
end