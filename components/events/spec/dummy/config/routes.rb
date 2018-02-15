Rails.application.routes.draw do
  mount Core::Engine, at: '/', as: :core
  mount Events::Engine, at: Events::Engine.mount_path, as: :events
end

