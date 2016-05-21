FactoryGirl.define do
  factory :role, class: 'AppComponent::Role' do
    sequence(:title) { |n| "Role #{n}"}
  end
end