require File.expand_path('../boot', __FILE__)

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
# require 'active_job/railtie'
# require 'rails/test_unit/railtie'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Locals
  class Application < Rails::Application
    middleware.delete ActionDispatch::Flash
    middleware.delete ActionDispatch::Static
    middleware.delete Rack::MethodOverride

    # Disable useless generators.
    config.generators.assets = false
    config.generators.helper = false

    config.serve_static_files = false

    # Load lib path.
    config.autoload_paths << Rails.root.join('lib')

    # Errors configurations.
    config.errors = YAML.load_file('config/errors.yml')

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run 'rake -D time' for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Brasilia'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :'pt-BR'

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true
  end
end
