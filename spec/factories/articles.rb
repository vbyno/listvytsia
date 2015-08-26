FactoryGirl.define do
  factory :article do
    title 'MyString'
    sequence(:permalink) { |n| "permalink_#{n}" }
    content '<p>MyText</p>'
    published true
    association :author, factory: :user
  end
end
