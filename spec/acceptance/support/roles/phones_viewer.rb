#encoding: utf-8
require 'spec_helper'

module Role
  module PhonesViewer
    def visits_phones
      visit phones_path
    end

    def sees_phone!(phone)
      sees! phone.full_name 
    end

    def sees_phone_details(phone, details)
      details.each do |detail, text|
        sees! text
        sees! phone.send(detail).to_s
      end
    end

    def sees_details_link(phone)
      sees_link! 'Szczegóły', href: phone_path(phone)
    end
  end
end
