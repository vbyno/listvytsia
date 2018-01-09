FactoryGirl.define do
  factory :micro_group, class: 'MicroGroups::MicroGroup' do
    city 'Lviv'
    name 'Micro group specialized on cells'
    sequence(:permalink) { |n| "permalink_#{ n }" }
    idea 'Some long long long text'
    leaders 'Anatoliy Dobrobramov, Eduard Ovcharenko'
    contacts '+38067 31 333 44, vvv@gmail.com'
    methodologies 'Very long text'
    published true
  end
end
