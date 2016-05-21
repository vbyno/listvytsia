FactoryGirl.define do
  factory :permission, class: 'AppComponent::Permission' do
    resource 'articles'
    sequence(:action) { |n| "action_#{n}" }
  end
end