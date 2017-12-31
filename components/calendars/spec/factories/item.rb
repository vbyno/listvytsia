FactoryGirl.define do
  factory :item, class: 'Calendars::Item' do
    city 'Lviv'
    start_date Time.new(2017, 01, 02)
    end_date Time.new(2017, 01, 03)
    contacts '+38067 31 333 44, vvv@gmail.com'
    course '1 курс'
  end
end
