Rails.application.routes.draw do
  root to: 'static_pages#index'

  get :contacts,  to: 'static_pages#contacts'
  get :timetable, to: 'static_pages#timetable'
  get :seminar,   to: 'static_pages#seminar'

  resources :articles, :roles
  resources :contact_forms, only: :create

  devise_for :users
  devise_for :admins
  mount Ckeditor::Engine => '/ckeditor'
end
