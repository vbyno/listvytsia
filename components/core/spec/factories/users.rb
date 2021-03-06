FactoryGirl.define do
  factory :user, class: 'Core::User' do
    sequence(:email) { |n| "email_#{n}@gmail.comx"}
    password "Q1w2e3+4r5t6y"
    confirmed_at { Time.now }
  end
end
