Core::Engine.routes.draw do
  root to: 'dashboard#index'

  namespace :admins do
    root to: 'dashboard#index'
    resources :roles, except: [:new, :edit]
    resources :users, except: [:new, :edit, :destroy]
  end

  devise_scope :user do
    delete 'sign_out', to: 'core/sessions#destroy', as: :destroy_omniauth_user_session
  end

  devise_for :users, class_name: 'Core::User',
                     module: :devise,
                     controllers: {
                       sessions: 'core/sessions',
                       omniauth_callbacks: 'core/omniauth_callbacks'
                     },
                     path_names: {
                       sign_in: 'login',
                       sign_out: 'logout',
                       sign_up: 'register',
                       edit: 'settings'
                     }

  devise_for :admins, class_name: 'Core::Admin',
                      module: :devise,
                      controllers: { sessions: 'core/admins/sessions' }
end
