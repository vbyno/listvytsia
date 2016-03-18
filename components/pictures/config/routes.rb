Pictures::Engine.routes.draw do
  resources :pictures, only: [:index, :create]
end
