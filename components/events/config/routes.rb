Events::Engine.routes.draw do
  resources :events, only: :show, constraints: { format: :json }

  namespace :admins do
    resources :events, only: %i( index show create update destroy ), constraints: { format: :json }
  end
end
