#encoding: utf-8
require 'acceptance_helper'

feature 'User visits shop and' do
  let(:user) do
    TestUser.new.
      extend(Role::PhonesViewer).
      extend(Role::PhonesSearcher)
  end

  before :each do
    @cat1 = FactoryGirl.create :category
    @cat2 = FactoryGirl.create :category, name: 'Kategoria 2'
    @phone1 = FactoryGirl.build :phone_full
    @phone2 = FactoryGirl.build :phone_full, name: 'Phone 2', model_name: 'model 2', manufacturer: 'Manufacturer2', price: 5.00
    @phone1.categories = [@cat1]
    @phone2.categories = [@cat2]
    @phone1.save
    @phone2.save

    user.visits_phones
  end

  scenario 'sees search box' do
    user.sees_search_box!(Category.all.collect(&:name))
  end

  scenario 'searches by name' do
    user.search_for(name: 'Full phone')
    user.sees_phone!(@phone1)

    user.search_for(name: 'phone')
    user.sees_phone!(@phone2)

    user.search_for(name: 'Other phone')
    user.sees! 'Brak telefonów do wyświetlenia'
  end

  scenario 'searches by manufacturer' do
    user.search_for(name: 'Manufacturer')
    user.sees_phone!(@phone1)
    user.sees_phone!(@phone2)

    user.search_for(name: 'Manufacturer2')
    user.sees_phone!(@phone2)

    user.search_for(name: 'Other manufacturer')
    user.sees! 'Brak telefonów do wyświetlenia'
  end

  scenario 'searches by model name' do
    user.search_for(name: 'model')
    user.sees_phone!(@phone1)
    user.sees_phone!(@phone2)

    user.search_for(name: 'model 2')
    user.sees_phone!(@phone2)

    user.search_for(name: 'model 3')
    user.sees! 'Brak telefonów do wyświetlenia'
  end

  scenario 'searches by price' do
    user.search_for(price_low: 3, price_high: 6)
    user.sees_phone!(@phone2)

    user.search_for(price_low: 7, price_high: 11.2)
    user.sees_phone!(@phone1)

    user.search_for(price_low: 7, price_high: 8)
    user.sees! 'Brak telefonów do wyświetlenia'
  end

  scenario 'searches by category' do
    user.search_for(categories: [@cat1.name])
    user.sees_phone!(@phone1)

    user.search_for(categories: [@cat2.name])
    user.sees_phone!(@phone2)

    user.search_for(categories: [@cat1.name, @cat2.name])
    user.sees_phone!(@phone1)
    user.sees_phone!(@phone2)
  end
end
