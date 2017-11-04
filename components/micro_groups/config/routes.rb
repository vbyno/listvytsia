MicroGroups::Engine.routes.draw do
  resources :micro_groups, only: %i( index create update destroy ), constraints: { format: :json }
end
