Rails.application.routes.draw do
  mount MicroGroups::Engine, at: MicroGroups::Engine.mount_path, as: :micro_groups
end

