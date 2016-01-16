FactoryGirl.define do
  factory :donation do
    amount Money.new(100.15, 'UAH')
    paid false
  end
end
