Profiles::Engine.routes.draw do
  resources :profiles, only: %i( index create update destroy ), constraints: { format: :json }
end
