$:.push File.expand_path('lib', __dir__)

Gem::Specification.new do |s|
  s.name        = 'calendars'
  s.version     = '0.0.1'
  s.authors     = ['Volodymyr Byno']
  s.email       = ['volodymyr.byno@gmail.com']
  s.summary     = 'Summary of Calendars.'
  s.description = 'Description of Calendars.'

  s.files = Dir['{app,config,db,lib}/**/*', 'Rakefile', 'README.rdoc']

  s.add_dependency 'mongoid'
  s.add_dependency 'mongoid_rails_migrations'
  s.add_dependency 'rails'
  s.add_dependency 'rabl'
  s.add_dependency 'core'
  s.add_dependency 'pictures'

  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'mongoid-rspec'
  s.add_development_dependency 'factory_girl'
  s.add_development_dependency 'fuubar'
  s.add_development_dependency 'pry'
end
