attributes :id, :title

child permissions: :permissions do
  attributes :id, :action, :resource
end
