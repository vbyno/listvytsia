Calendars::Engine.routes.draw do
  get '/calendar', controller: 'calendars/calendars', action: :show, constraints: { format: :json }

  namespace :admins do
    resources :items, only: %i( index show create update destroy ), constraints: { format: :json }
  end
end
