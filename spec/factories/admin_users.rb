# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :admin_user do
    email 'test@email.com'
    password 'testpass'
    password_confirmation 'testpass'
  end
end
