#encoding: utf-8

module Role
  module PhonesViewer
    include ::Capybara::DSL
    include ::Capybara::RSpecMatchers

    def visits_phones
      visit phones_path
    end

    def sees_phone!(phone)
      sees! phone.full_name 
    end

    def sees_phone_details(phone, *details_arr)
      details_arr.each do |detail|
        sees! detail.to_s.upcase
        sees! phone.send(detail).to_s
      end
    end

    def sees_details_link(phone)
      sees_link! 'Szczegóły', phone_path(phone)
    end
  end
end
