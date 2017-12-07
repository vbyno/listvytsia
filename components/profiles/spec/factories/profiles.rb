FactoryGirl.define do
  factory :profile, class: 'Profiles::Profile' do
    first_name 'John'
    last_name 'Snow'
    published true
  end
end
