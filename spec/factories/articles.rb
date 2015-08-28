FactoryGirl.define do
  factory :article do
    title 'MyString'
    sequence(:permalink) { |n| "permalink_#{n}" }
    content '<p>My loooong Text</p>'
    content_intro 'My Text...'
    published true
    association :author, factory: :user
  end
end