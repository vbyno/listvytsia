Rails.application.routes.draw do
  root to: 'static_pages#index'

  get :contacts,  to: 'static_pages#contacts'
  get :timetable, to: 'static_pages#timetable'
  get :seminar,   to: 'static_pages#seminar'

  resources :articles
  resources :contact_forms, only: :create

  namespace :admin do
    root to: 'dashboard#index'
    resources :roles, except: [:new, :edit]
    resources :users, except: [:new, :edit, :destroy]
  end

  devise_for :users
  devise_for :admins, controllers: { sessions: 'admin/sessions' }
  mount Ckeditor::Engine => '/ckeditor'
end
