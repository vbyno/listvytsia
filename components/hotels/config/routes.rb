Hotels::Engine.routes.draw do
  resources :hotels, only: %i( index create update destroy ), constraints: { format: :json }
end
