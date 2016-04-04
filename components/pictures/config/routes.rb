Pictures::Engine.routes.draw do
  resources :pictures, only: [:index, :create, :update], format: :true
end
