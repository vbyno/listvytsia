Chunks::Engine.routes.draw do
  namespace :admins do
    resources :chunks, only: %i( index show create update destroy ), constraints: { format: :json }
  end
end
