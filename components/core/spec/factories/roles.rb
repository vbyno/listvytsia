FactoryGirl.define do
  factory :role, class: 'Core::Role' do
    sequence(:title) { |n| "Role #{n}"}
  end
end
