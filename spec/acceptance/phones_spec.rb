#encoding: utf-8
require 'acceptance_helper'

feature 'User visits phones index page and' do
  let (:user) { TestUser.new.extend(Role::PhonesViewer) }

  scenario "sees header 'Lista wszystkich telefonów'" do
    user.visits_phones

    user.sees! 'Lista wszystkich telefonów'
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

feature 'Admin visits phones index page and' do
  let (:user) { 
    TestUser.new.
      extend(Role::PhonesViewer).
      extend(Role::Admin)
  }
  
  background :each do
    FactoryGirl.create :admin_user
    @phone1 = FactoryGirl.create :phone
    @phone2 = FactoryGirl.create :phone_full

    user.visits_admin_phones
    user.login_as_admin
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

  scenario "deletes a phone after clicking 'Usuń' link" do
    user.click_on 'Usuń'
    expect(Phone.all.count).to eql 1
  end

end

feature 'Admin visits phones new page' do
  let (:user) { 
    TestUser.new.
      extend(Role::PhonesViewer).
      extend(Role::Admin)
  }

  background :each do
    FactoryGirl.create :admin_user
    FactoryGirl.create :category

    user.visits_admin_phones
    user.login_as_admin

    user.click_on 'Dodaj'
  end

  scenario 'sees the form for adding new phone' do
    user.sees_phone_form!
  end

  scenario "adds new phone after clicking 'Zapisz'" do
    user.fill_in 'Nazwa', with: 'Xperia S'
    user.fill_in 'Producent', with: 'Sony'
    user.click_on 'Zapisz'
    phones = Phone.all
    expect(phones.count).to eql 1
  end
end

feature 'Admin visits phones edit page' do
  let (:user) { 
    TestUser.new.
      extend(Role::PhonesViewer).
      extend(Role::Admin)
  }

  background :each do
    FactoryGirl.create :admin_user
    FactoryGirl.create :category
    @phone = FactoryGirl.create :phone

    user.visits_admin_phones
    user.login_as_admin

    user.click_on 'Edytuj'
  end

  scenario 'sees the form for editing phone' do
    user.sees_phone_form!
  end

  scenario "edits the phone after clicking 'Zapisz'", :focus do
    user.fill_in 'Nazwa', with: 'Xperia S'
    user.fill_in 'Producent', with: 'Sony'
    user.click_on 'Zapisz'
    @phone = Phone.find_by_id(@phone)
    expect(@phone.name).to eql 'Xperia S'
    expect(@phone.manufacturer).to eql 'Sony'
  end
end
