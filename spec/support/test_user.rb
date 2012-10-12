
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

  def sees_link!(name, href = nil)
    expect(page).to have_link(name, href: href)
  end
end
