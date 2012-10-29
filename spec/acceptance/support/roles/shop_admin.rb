module Role
  module ShopAdmin
    def login_as_admin
      fill_in 'Email', with: 'test@email.com'
      fill_in 'Password', with: 'testpass'
      click_on 'Sign in'
    end
  end
end
