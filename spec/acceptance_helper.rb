require 'spec_helper'

Spork.each_run do
  Dir[Rails.root.join("spec/acceptance/support/**/*.rb")].each {|f| require f}
end