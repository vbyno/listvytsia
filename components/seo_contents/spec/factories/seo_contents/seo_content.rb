FactoryGirl.define do
  factory :seo_content, class: 'SeoContents::SeoContent'  do
    sequence(:target_id) { |n| "target_id_#{n}"}
  end
end

