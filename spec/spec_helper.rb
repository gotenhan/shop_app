require 'spork'

Spork.prefork do
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'rspec/autorun'

  require 'capybara/rspec'
  require 'capybara/rails'

  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  DatabaseCleaner.strategy = :truncation

  RSpec.configure do |config|
    config.fixture_path = "#{::Rails.root}/spec/fixtures"
    config.use_transactional_fixtures = false
    config.infer_base_class_for_anonymous_controllers = false
    config.order = "random"

    config.before :each do
      DatabaseCleaner.start
    end
    config.after :each do
      DatabaseCleaner.clean
    end
  end
end

Spork.each_run do
end

