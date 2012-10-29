#encoding: utf-8
require 'spec_helper'

module Role
  module PhonesBuyer
    def sees_mini_cart
      sees_selector! '#mini_cart'
    end
  end
end
