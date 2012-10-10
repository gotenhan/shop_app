class ShopController < ApplicationController
  def index
    render text: 'Hello in my shop!', layout: 'application'
  end
end
