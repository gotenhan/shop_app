#encoding: utf-8

class TestUser
  include ::Rails.application.routes.url_helpers
  include ::Capybara::DSL
  include ::Capybara::RSpecMatchers
  include ::RSpec::Matchers

  def sees!(something)
    expect(page).to have_content(something)
  end

  def within(selector, &blk)
    page.within selector do
      instance_exec &blk
    end
  end

  def sees_link!(name, options = {})
    expect(page).to have_link(name, options)
  end

  def sees_button!(name)
    expect(page).to have_button(name)
  end

  def sees_field!(name)
    expect(page).to have_button(name)
  end

  def login(user, pass)
    fill_in 'Użytkownik', with: user
    fill_in 'Hasło', with: pass
    click_on 'Zaloguj'
  end
end
