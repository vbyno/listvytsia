$:.push File.expand_path('../lib', __FILE__)

require 'chunks/version'

Gem::Specification.new do |s|
  s.name        = 'chunks'
  s.version     = Chunks::VERSION
  s.authors     = ['Volodymyr Byno']
  s.email       = ['volodymyr.byno@gmail.com']
  s.summary     = 'Summary of Chunks.'
  s.description = 'Description of Chunks.'

  s.files = Dir['{app,config,db,lib}/**/*', 'Rakefile', 'README.rdoc']

  s.add_dependency 'mongoid'
  s.add_dependency 'mongoid_rails_migrations'
  s.add_dependency 'core'

  s.add_development_dependency 'mongoid-rspec'
  s.add_development_dependency 'factory_girl'
  s.add_development_dependency 'fuubar'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'rspec-rails'
end
