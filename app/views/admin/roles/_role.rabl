attributes :id, :title

child :permissions do
  attributes :action, :resource
end
