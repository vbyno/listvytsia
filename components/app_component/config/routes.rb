AppComponent::Engine.routes.draw do
  mount Core::Engine, at: '/', as: :core
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
    resources :static_pages, except: [:new, :edit, :destroy]
  end

  mount Ckeditor::Engine => '/ckeditor'
end
