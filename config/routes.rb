Rails.application.routes.draw do
  root to: 'static_pages#index'

  get :contacts,  to: 'static_pages#contacts'
  get :timetable, to: 'static_pages#timetable'
  get :seminar,   to: 'static_pages#seminar'

  resources :articles
  resources :contact_forms, only: :create

  namespace :admin do
    resources :roles, :users
  end

  devise_for :users
  devise_for :admins
  mount Ckeditor::Engine => '/ckeditor'
end
