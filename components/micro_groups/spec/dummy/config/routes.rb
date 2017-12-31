Rails.application.routes.draw do
  mount Core::Engine, at: '/', as: :core
  mount MicroGroups::Engine, at: MicroGroups::Engine.mount_path, as: :micro_groups
end

