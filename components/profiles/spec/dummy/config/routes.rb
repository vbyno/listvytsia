Rails.application.routes.draw do
  mount Profiles::Engine, at: Profiles::Engine.mount_path, as: :profiles
end

