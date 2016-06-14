$:.push File.expand_path('../lib', __FILE__)

require 'core/version'

Gem::Specification.new do |s|
  s.name        = 'core'
  s.version     = Core::VERSION
  s.authors     = ['Volodymyr Byno']
  s.email       = ['volodymyr.byno@gmail.com']
  s.summary     = 'Summary of Core.'
  s.description = 'Description of Core.'

  s.files = Dir['{app,config,db,lib}/**/*', 'Rakefile', 'README.rdoc']

  s.add_dependency 'mongoid', '5.1.1'
  s.add_dependency 'mongoid_rails_migrations'
  s.add_dependency 'pundit', '1.1.0'
  s.add_dependency 'rails', '4.2.5'
  s.add_dependency 'devise', '3.5.3'
  s.add_dependency 'figaro', '1.1.1'
  s.add_dependency 'deface', '1.0.2'

  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'mongoid-rspec'
  s.add_development_dependency 'factory_girl'
  s.add_development_dependency 'fuubar'
  s.add_development_dependency 'pry'
end
