$:.push File.expand_path('lib', __dir__)

Gem::Specification.new do |s|
  s.name        = 'seo_contents'
  s.version     = '0.0.1'
  s.authors     = ['Volodymyr Byno']
  s.email       = ['volodymyr.byno@gmail.com']
  s.summary     = 'Summary of SeoContents'
  s.description = 'Description of SeoContents'

  s.files = Dir['{app,config,db,lib}/**/*', 'Rakefile']
  s.test_files = Dir['spec/**/*']

  s.add_dependency 'rails'
  s.add_dependency 'rake'
  s.add_dependency 'mongoid'
  s.add_dependency 'mini_magick'
  s.add_dependency 'carrierwave-mongoid'
  s.add_dependency 'coffee-rails'
  s.add_dependency 'angularjs-rails'
  s.add_dependency 'angular-rails-templates'
  s.add_dependency 'slim-rails'
  s.add_dependency 'rabl'
  s.add_dependency 'sass'

  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'fuubar'
  s.add_development_dependency 'pry-rails'
  s.add_development_dependency 'factory_girl_rails'
end
