#encoding: utf-8
require 'acceptance_helper'

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

    scenario "sees the price, CPU, RAM and OS section of phone" do
      user.sees_phone_details(@phone1, { price: 'Cena', cpu: 'CPU', os: 'OS', ram: 'RAM'})
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

feature 'Admin visits phones index page' do
  let (:user) { TestUser.new.extend(Role::PhonesViewer) }
  
  background :each do
    @phone1 = FactoryGirl.create :phone
    @phone2 = FactoryGirl.create :phone_full

    @phone1.save!
    @phone2.save!

    user.visits_admin_phones
    #user.login
  end

  scenario "sees the admin/show links" do
    user.sees_admin_details_link(@phone1)
    user.sees_admin_details_link(@phone2)
  end

  scenario "sees the admin/edit links" do
    user.sees_admin_edit_link(@phone1)
    user.sees_admin_edit_link(@phone2)
  end

  scenario "sees the admin/delete links" do
    user.sees_admin_delete_link(@phone1)
    user.sees_admin_delete_link(@phone2)
  end

  scenario "sees the admin/new link" do
    user.sees_admin_new_link
  end
end
