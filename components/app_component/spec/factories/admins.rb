FactoryGirl.define do
  factory :admin, class: 'AppComponent::Admin' do
    sequence(:email) { |n| "admin_email_#{n}@gmail.comx"}
    password "Q1w2e3+4r5t6y"
  end
end
