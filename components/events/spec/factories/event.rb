FactoryGirl.define do
  factory :event, class: 'Events::Event' do
    city 'Lviv'
    start_time Time.new(2017, 01, 02)
    end_time Time.new(2017, 01, 03)
    contacts '+38067 31 333 44, vvv@gmail.com'
    course '1 курс'
  end
end
