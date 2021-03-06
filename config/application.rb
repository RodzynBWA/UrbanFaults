require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module UrbanFaults
  class Application < Rails::Application
    config.i18n.available_locales = [:pl]
     config.i18n.default_locale = :pl
    config.active_record.raise_in_transactional_callbacks = true
  end
end
