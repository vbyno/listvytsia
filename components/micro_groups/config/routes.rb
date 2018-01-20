MicroGroups::Engine.routes.draw do
  get '/timetable', to: redirect(path: '/lviv')

  resources :micro_groups, only: %i( index show )

  namespace :admins do
    resources :micro_groups,
              :regions,
              only: %i( index show create update destroy ),
              constraints: { format: :json }
  end

  MicroGroups.region_permalinks.each do |permalink|
    get MicroGroups.region_path(permalink),
        to: 'regions#show',
        defaults: { permalink: permalink }

    get "/#{ permalink }/micro_groups/:permalink",
      to: 'micro_groups#show',
      defaults: { region_permalink: permalink }

    get "/#{ permalink }/events/:permalink",
      to: 'events#show',
      defaults: { region_permalink: permalink }
  end
end
