#encoding: utf-8
require 'spec_helper'

module Role
  module PhonesSearcher
    def sees_search_box!(categories = [])
      sees_selector! '#mini_search_box'
      within '#mini_search_box' do
        sees_field! 'Nazwa'
        within_fieldset 'Kategorie' do
          categories.each do |category|
            sees_field! category
          end
        end
        sees_field! 'Cena od'
        sees_field! 'Cena do'
        sees_button! 'Szukaj'
      end
    end

    def search_for(criteria)
      within '#mini_search_box' do
        fill_in 'Nazwa', with: criteria[:name]
        if criteria[:categories]
           criteria[:categories].each { |name| check name  }
        end
        fill_in 'Cena od', with: criteria[:price_low]
        fill_in 'Cena do', with: criteria[:price_high]
        click_on 'Szukaj'
      end
    end

  end
end
