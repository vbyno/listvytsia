attributes :id, :title, :permalink, :content, :published

child :seo_content do
  attributes :title, :description, :keywords
end
