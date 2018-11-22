AppComponent::Engine.routes.draw do
  mount Core::Engine,        at: '/',                            as: :core
  mount Ckeditor::Engine,    at: '/'
  mount Pictures::Engine,    at: Pictures::Engine.mount_path,    as: :pictures_engine
  mount Hotels::Engine,      at: Hotels::Engine.mount_path,      as: :hotels
  mount Chunks::Engine,      at: Chunks::Engine.mount_path,      as: :chunks
  mount MicroGroups::Engine, at: MicroGroups::Engine.mount_path, as: :micro_groups_component
  mount Calendars::Engine,   at: Calendars::Engine.mount_path,   as: :calendars_component
  mount Events::Engine,      at: Events::Engine.mount_path,      as: :events_component

  get :contacts,       to: 'static_pages#contacts'
  get :seminar,        to: 'static_pages#seminar'
  get :donate,         to: 'static_pages#donate'
  get :privacy_policy, to: 'static_pages#privacy_policy'

  resources :articles
  resources :events, path: :activities
  resources :contact_forms, only: :create
  resources :donations, only: :create do
    post :confirm, on: :collection
  end

  namespace :admins do
    resources :static_pages, except: [:new, :edit, :destroy]
  end
end
