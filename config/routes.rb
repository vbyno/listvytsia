Rails.application.routes.draw do
  root to: 'static_pages#index'
  get :contacts,  to: 'static_pages#contacts'
  get :timetable, to: 'static_pages#timetable'
  get :articles,  to: 'static_pages#articles'
  resources :contact_forms, only: :create
end
