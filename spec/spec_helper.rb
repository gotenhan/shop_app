require 'spork'

Spork.prefork do
  ENV["RAILS_ENV"] ||= 'test'
  require 'rspec/rails'
  require 'rspec/autorun'

  require 'capybara/rspec'
  require 'capybara/rails'

  require 'rails/application'
  Spork.trap_method(Rails::Application::RoutesReloader, :reload!)
  Spork.trap_method(Rails::Application, :eager_load!)

  require 'factory_girl_rails'
  Spork.trap_class_method(FactoryGirl, :find_definitions)

  require File.expand_path("../../config/environment", __FILE__)
  Rails.application.railties.all { |r| r.eager_load! }

  DatabaseCleaner.strategy = :truncation

  RSpec.configure do |config|
    config.fixture_path = "#{::Rails.root}/spec/fixtures"
    config.use_transactional_fixtures = false
    config.infer_base_class_for_anonymous_controllers = false
    config.order = "random"
    config.treat_symbols_as_metadata_keys_with_true_values = true
    config.include Devise::TestHelpers, type: :controller

    config.before :each do
      DatabaseCleaner.start
    end
    config.after :each do
      DatabaseCleaner.clean
    end
  end
end

Spork.each_run do
  FactoryGirl.reload
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}
end

