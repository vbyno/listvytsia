FactoryGirl.define do
  factory :role do
    sequence(:title) { |n| "Role #{n}"}
  end
end