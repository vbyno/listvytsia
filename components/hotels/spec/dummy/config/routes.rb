Rails.application.routes.draw do
  mount Hotels::Engine, at: Hotels::Engine.mount_path, as: :hotels
end

