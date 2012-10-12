require 'spec_helper'

describe Phone do
  before :each do
    @phone = FactoryGirl.create :phone, model_name: 'superphone'
  end

  describe '#full_name' do
    it 'should create full name in format: manufacturer name (model)' do
      @phone.full_name == "manufacturer phone (suerphone)"
    end
  end

  describe '#new' do
    it 'should not allow to create phone without name' do
      phone = Phone.new(manufacturer: 'Nokia')
      expect(phone.valid?).to be_false
    end

    it 'should not allow to create phone without name' do
      phone = Phone.new(name: 'Lumia 920')
      expect(phone.valid?).to be_false
    end
  end
end
