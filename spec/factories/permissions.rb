FactoryGirl.define do
  factory :permission do
    resource 'articles'
    sequence(:action) { |n| "action_#{n}" }
  end
end