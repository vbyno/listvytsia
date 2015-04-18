Rails.application.routes.draw do
  root to: 'static_pages#index'
  get :about_us,  to: 'static_pages#about_us'
  get :contacts,  to: 'static_pages#contacts'
  get :timetable, to: 'static_pages#timetable'
  get :articles,  to: 'static_pages#articles'
end
