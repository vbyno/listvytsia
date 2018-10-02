$:.push File.expand_path('lib', __dir__)

Gem::Specification.new do |s|
  s.name        = 'core'
  s.version     = '0.0.1'
  s.authors     = ['Volodymyr Byno']
  s.email       = ['volodymyr.byno@gmail.com']
  s.summary     = 'Summary of Core.'
  s.description = 'Description of Core.'

  s.files = Dir['{app,config,db,lib}/**/*', 'Rakefile', 'README.rdoc']

  s.add_dependency 'mongoid'
  s.add_dependency 'mongoid_rails_migrations'
  s.add_dependency 'pundit'
  s.add_dependency 'rails', '5.1.1'
  s.add_dependency 'deface'
  s.add_dependency 'devise'
  s.add_dependency 'figaro'
  s.add_dependency 'rabl'
  s.add_dependency 'oj'
  s.add_dependency 'slim-rails'
  s.add_dependency 'require_all'
  s.add_dependency 'omniauth'
  s.add_dependency 'omniauth-facebook'
  s.add_dependency 'omniauth-google-oauth2'
  s.add_dependency 'dry-initializer'
  s.add_dependency 'recaptcha'

  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'mongoid-rspec'
  s.add_development_dependency 'factory_girl'
  s.add_development_dependency 'fuubar'
  s.add_development_dependency 'pry'
end
