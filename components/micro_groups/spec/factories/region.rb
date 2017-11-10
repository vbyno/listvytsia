FactoryGirl.define do
  factory :region, class: 'MicroGroups::Region' do
    sequence(:name) { |n| "Lviv #{n}" }
    sequence(:permalink) { |n| "permalink_#{n}" }
    info 'Some long long long text'
    priority 1
    calendar_url nil
    published true
  end
end
