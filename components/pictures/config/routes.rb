Pictures::Engine.routes.draw do
  resources :pictures, only: [:index, :create], path: '/', format: true
end
