#encoding: utf-8
require 'acceptance_helper'

feature 'User visits phones index page and' do
  let (:user) { TestUser.new.extend(Role::PhonesViewer) }

  scenario "sees header 'Wszystkie telefony'" do
    user.visits_phones

    user.sees! 'Wszystkie telefony'
  end

  context "if there are phones in the database" do
    background :each do
      @phone1 = FactoryGirl.create :phone
      @phone2 = FactoryGirl.create :phone_full

      @phone1.save!
      @phone2.save!
      
      user.visits_phones
    end

    scenario "sees the list of all phones" do
      user.sees_phone!(@phone1)
      user.sees_phone!(@phone2)
    end

    scenario "sees the price, CPU, RAM and OS section of phone" do
      user.sees_phone_details(@phone1, { price: 'Cena', cpu: 'CPU', os: 'OS', ram: 'RAM'})
    end

    scenario "sees the details links" do
      user.sees_details_link(@phone1)
      user.sees_details_link(@phone2)
    end

  end

  context "if there are no phones in the database" do
    scenario "sees 'Brak telefonów do wyświetlenia'" do
      user.visits_phones
      user.sees! 'Brak telefonów do wyświetlenia'
    end
  end

end
