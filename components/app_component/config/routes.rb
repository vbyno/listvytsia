AppComponent::Engine.routes.draw do
  root to: 'static_pages#index'

  mount Pictures::Engine, at: Pictures::Engine.mount_path, as: :pictures_engine

  get :contacts,  to: 'static_pages#contacts'
  get :timetable, to: 'static_pages#timetable'
  get :seminar,   to: 'static_pages#seminar'
  get :donate,    to: 'static_pages#donate'

  resources :articles, :events
  resources :contact_forms, only: :create
  resources :donations, only: :create do
    post :confirm, on: :collection
  end

  namespace :admins do
    root to: 'dashboard#index'
    resources :roles, except: [:new, :edit]
    resources :users, except: [:new, :edit, :destroy]
    resources :static_pages, except: [:new, :edit, :destroy]
  end

  devise_for :users, class_name: 'AppComponent::User', controllers: { sessions: 'app_component/sessions' }
  devise_for :admins, class_name: 'AppComponent::Admin', controllers: { sessions: 'app_component/admins/sessions' }
  mount Ckeditor::Engine => '/ckeditor'
end
