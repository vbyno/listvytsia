require_relative 'all'

namespace :db do
  desc 'Pull production db to development'
  task pull: %i( dump_production restore_development )

  desc 'Dump production database'
  task :dump_production, &Tasks::DB::DumpProduction

  desc 'Restore development database from the dumpfile'
  task :restore_development, &Tasks::DB::RestoreDevelopment
end

namespace :images do
  desc 'Pull images from production'
  task :pull, &Tasks::Images::Pull
end

namespace :events do
  desc 'Grab events from calendar items'
  task grab_from_calendar_items: :environment, &Tasks::Events::GrabFromCalendarItems
end
