MicroGroups::Engine.routes.draw do
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
  end
end
