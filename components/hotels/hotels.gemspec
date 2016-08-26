$:.push File.expand_path('../lib', __FILE__)

require 'hotels/version'

Gem::Specification.new do |s|
  s.name        = 'hotels'
  s.version     = Hotels::VERSION
  s.authors     = ['Volodymyr Byno']
  s.email       = ['volodymyr.byno@gmail.com']
  s.summary     = 'Summary of Hotels.'
  s.description = 'Description of Hotels.'

  s.files = Dir['{app,config,db,lib}/**/*', 'Rakefile', 'README.rdoc']

  s.add_dependency 'mongoid', '5.1.1'
  s.add_dependency 'mongoid_rails_migrations'
  s.add_dependency 'rails', '4.2.6'
  s.add_dependency 'rabl', '0.11.8'
  s.add_dependency 'core'
  s.add_dependency 'pictures'

  s.add_development_dependency 'mongoid-rspec'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'factory_girl'
  s.add_development_dependency 'fuubar'
  s.add_development_dependency 'pry'
end
