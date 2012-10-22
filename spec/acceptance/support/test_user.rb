#encoding: utf-8

class TestUser
  include ::Rails.application.routes.url_helpers
  include ::Capybara::DSL
  include ::Capybara::RSpecMatchers
  include ::RSpec::Matchers

  def sees!(something)
    expect(page).to have_content(something)
  end

  def within(*args, &blk)
    page.within *args do
      instance_exec &blk
    end
  end

  def within_fieldset(*args, &blk)
    page.within_fieldset *args do
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
    expect(page).to have_field(name)
  end

  def sees_select!(name)
    expect(page).to have_select(name)
  end

  def sees_fieldset!(name)
    expect(page).to have_field_set(name)
  end

  def method_missing(method_sym, *args, &block)
    page.send(method_sym, *args, &block)
  end

end
