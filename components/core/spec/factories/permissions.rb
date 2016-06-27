FactoryGirl.define do
  factory :permission, class: 'Core::Permission' do
    resource 'articles'
    sequence(:action) { |n| "action_#{n}" }
  end
end
