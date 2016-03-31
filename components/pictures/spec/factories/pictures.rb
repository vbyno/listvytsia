FactoryGirl.define do
  factory :picture, class: 'Pictures::Picture'  do
    sequence(:page_id) { |n| "page_id_#{n}"}
    data { File.new(File.expand_path('../../support/images/picture.jpg', __FILE__)) }
  end
end

