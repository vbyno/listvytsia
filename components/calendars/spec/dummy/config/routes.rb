Rails.application.routes.draw do
  mount Core::Engine, at: '/', as: :core
  mount Calendars::Engine, at: Calendars::Engine.mount_path, as: :calendars
end

