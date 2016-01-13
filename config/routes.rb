Rails.application.routes.draw do
  root to: 'static_pages#index'

  get :contacts,  to: 'static_pages#contacts'
  get :timetable, to: 'static_pages#timetable'
  get :seminar,   to: 'static_pages#seminar'
  get :donate,    to: 'static_pages#donate'

  resources :articles
  resources :contact_forms, only: :create
  resources :donations, only: :create do
    post :confirm, on: :collection
  end

  namespace :admin do
    root to: 'dashboard#index'
    resources :roles, except: [:new, :edit]
    resources :users, except: [:new, :edit, :destroy]
  end

  devise_for :users
  devise_for :admins, controllers: { sessions: 'admin/sessions' }
  mount Ckeditor::Engine => '/ckeditor'
end
