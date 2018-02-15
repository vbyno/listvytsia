require 'micro_groups'

Events::Engine.routes.draw do
  MicroGroups.all_region_permalinks.each do |permalink|
    get "/#{ permalink }/events/:permalink",
      to: 'events#show',
      defaults: { region_permalink: permalink }
  end

  namespace :admins do
    resources :events, only: %i( index show create update destroy ), constraints: { format: :json }
  end
end
