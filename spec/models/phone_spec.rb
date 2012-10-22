require 'spec_helper'

describe Phone do
  before :each do
    @phone = FactoryGirl.create :phone, model_name: 'superphone'
  end

  describe '#full_name' do
    it 'should create full name in format: manufacturer name (model)' do
      expect(@phone.full_name).to eql "Manufacturer Phone (superphone)"
    end
  end

  describe '#new' do
    it 'should not allow to create phone without name' do
      phone = Phone.new
      expect(phone.valid?).to be_false
    expect(phone.errors.keys).to include(:name)
    end

    it 'should not allow to create phone without manufacturer' do
      phone = Phone.new
      expect(phone.valid?).to be_false
    expect(phone.errors.keys).to include(:manufacturer)
    end
  end

  it 'should allow to create phone with price greater than or equal to 0' do
    phone = Phone.new(name: 'test', manufacturer: 'test', price: '0')
    expect(phone.valid?).to be_true

    phone = Phone.new(name: 'test', manufacturer: 'test', price: '1')
    expect(phone.valid?).to be_true
  end

  it 'should not allow to create phone with price less than 0' do
    phone = Phone.new(price: '-1')
    expect(phone.valid?).to be_false
    expect(phone.errors.keys).to include(:price)
  end

end
