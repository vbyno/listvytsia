MicroGroups::Engine.routes.draw do
  resources :micro_groups, only: %i( index show )

  namespace :admins do
    resources :micro_groups, only: %i( index show create update destroy ), constraints: { format: :json }
  end
end
