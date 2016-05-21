SeoContents::Engine.routes.draw do
  resources :seo_contents, only: [:create, :show, :update, :destroy], format: :true
end
