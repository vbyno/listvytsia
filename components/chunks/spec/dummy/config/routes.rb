Rails.application.routes.draw do
  mount Chunks::Engine => '/chunks'
end
