FactoryGirl.define do
  factory :donation, class: 'AppComponent::Donation' do
    amount ::Money.new(100.15, 'UAH')
    paid false
  end
end
