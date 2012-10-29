require 'spec_helper'

Spork.prefork do
  require 'acceptance/support/roles/shop_admin'
  Dir[Rails.root.join("spec/acceptance/support/**/*.rb")].each {|f| require f}
end
