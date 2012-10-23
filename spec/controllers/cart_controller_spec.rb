require 'spec_helper'

describe CartController do
  describe '#add_to_cart' do
    context 'when buyer did not have ordered phone in cart' do
      before :each do
        stub(:@cookies).and_return({})
        
        phone = FactoryGirl.create :phone
        FactoryGirl.create :order
        FactoryGirl.create 
      end

    end
  end
end
