attributes :id, :title, :permalink, :content, :published

child permissions: :permissions do
  attributes :id, :action, :resource
end
