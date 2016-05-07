FactoryGirl.define do
  factory :user, class: 'AppComponent::User' do
    sequence(:email) { |n| "email_#{n}@gmail.comx"}
    password "Q1w2e3+4r5t6y"
  end
end
