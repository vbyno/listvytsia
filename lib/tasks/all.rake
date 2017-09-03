require_relative 'all'

namespace :db do
  desc 'Pull production db to development'
  task pull: %i( dump_production restore_development )

  desc 'Dump production database'
  task :dump_production, &Tasks::DB::DumpProduction.new

  desc 'Restore development database from the dumpfile'
  task :restore_development, &Tasks::DB::RestoreDevelopment.new
end

namespace :images do
  desc 'Pull images from production'
  task :pull, &Tasks::Images::Pull.new
end
