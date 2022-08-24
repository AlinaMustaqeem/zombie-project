# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'
Bundler.require(*Rails.groups)

module ZombieApp
  class Application < Rails::Application
    config.load_defaults 5.2
  end
end
