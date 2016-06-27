FactoryGirl.define do
  factory :hotel, class: 'Hotels::Hotel' do
    title 'Hotel'
    phone '+380673130031 - Оксана'
    price '150 грн./доба'
    address 'вул. Стрийська, 2'
    published true
  end
end
