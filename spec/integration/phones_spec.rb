#encoding: utf-8
require 'spec_helper'

feature 'User visits phones index page' do
  let (:user) { TestUser.new.extend(Role::PhonesViewer) }

  scenario "and sees header 'Lista wszystkich telefonów'" do
    user.visits_phones

    user.sees! 'Lista wszystkich telefonów'
  end

  context "and if there are phones in the database" do
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

    scenario "sees the CPU, RAM and OS section of phone" do
      user.sees_phone_details(@phone1, :cpu, :os, :ram)
    end

    scenario "sees the details links" do
      user.sees_details_link(@phone1)
      user.sees_details_link(@phone2)
    end

  end

  context "and if there are no phones in the database" do
    scenario "sees 'Brak telefonów do wyświetlenia'" do
      user.visits_phones
      user.sees! 'Brak telefonów do wyświetlenia'
    end
  end
end
