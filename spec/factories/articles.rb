FactoryGirl.define do
  factory :article do
    title 'MyString'
    sequence(:permalink) { |n| "permalink_#{n}" }
    content 'MyText'
    active true
  end
end
