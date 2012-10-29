#encoding: utf-8
require 'acceptance_helper'


feature 'Admin visits phones index page and' do
  let (:user) { 
    TestUser.new.
      extend(Role::PhonesViewer).
      extend(Role::PhonesAdmin)
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
      extend(Role::PhonesAdmin)
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
    within '#new_phone' do
      user.fill_in 'Nazwa*', with: 'Xperia S'
      user.fill_in 'Producent*', with: 'Sony'
      user.click_on 'Zapisz'
    end

    phones = Phone.all
    expect(phones.count).to eql 1
  end
end

feature 'Admin visits phones edit page' do
  let (:user) { 
    TestUser.new.
      extend(Role::PhonesViewer).
      extend(Role::PhonesAdmin)
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
    within "#edit_phone_#{@phone.id}" do
      user.fill_in 'Nazwa', with: 'Xperia S'
      user.fill_in 'Producent', with: 'Sony'
      user.click_on 'Zapisz'
    end

    @phone = Phone.find_by_id(@phone)
    expect(@phone.name).to eql 'Xperia S'
    expect(@phone.manufacturer).to eql 'Sony'
  end
end
