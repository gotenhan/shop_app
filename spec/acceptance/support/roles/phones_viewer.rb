#encoding: utf-8
require 'spec_helper'

module Role
  module PhonesViewer
    def visits_phones
      visit phones_path
    end

    def visits_admin_phones
      visit admin_phones_path
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

    def sees_admin_details_link(phone)
      sees_link! 'Szczegóły', href: admin_phone_path(phone)
    end

    def sees_admin_edit_link(phone)
      sees_link! 'Edytuj', href: edit_admin_phone_path(phone)
    end

    def sees_admin_delete_link(phone)
      sees_link! 'Usuń', href: admin_phone_path(phone), method: 'delete'
    end

    def sees_admin_new_link
      sees_link! 'Dodaj', href: new_admin_phone_path
    end

    def sees_phone_form!
      within('.phone_form') do
        sees_field! 'Nazwa*'
        sees_field! 'Model'
        sees_field! 'Producent*'
        sees_field! 'Procesor'
        sees_field! 'Akcelerator graficzny'
        sees_field! 'Pamięć RAM'
        sees_select! 'System operacyjny'
        sees_field! 'Wersja systemu operacyjnego'
        within_fieldset 'Kategorie' do
          sees_field! 'Testowa kategoria'
        end
        sees_button! 'Zapisz'
      end
    end
  end
end
