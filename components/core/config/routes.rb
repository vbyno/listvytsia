Core::Engine.routes.draw do
  devise_for :users, class_name: 'Core::User', controllers: { sessions: 'app_component/sessions' }
  devise_for :admins, class_name: 'Core::Admin', controllers: { sessions: 'app_component/admins/sessions' }
end
