Pictures::Engine.routes.draw do
  resources :pictures, only: [:index, :create, :update, :destroy], format: :true
end
