Core::Engine.routes.draw do
  root to: 'dashboard#index'

  namespace :admins do
    root to: 'dashboard#index'
    resources :roles, except: [:new, :edit]
    resources :users, except: [:new, :edit, :destroy]
  end

  devise_for :users, class_name: 'Core::User', module: :devise, controllers: { sessions: 'core/sessions' }
  devise_for :admins, class_name: 'Core::Admin', module: :devise, controllers: { sessions: 'core/admins/sessions' }
end
