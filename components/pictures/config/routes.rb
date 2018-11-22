Pictures::Engine.routes.draw do
  resources :pictures,
    only: [:index, :create, :update, :destroy],
    controller: 'pictures/pictures',
    format: :true
end
