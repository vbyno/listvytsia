Gem::Specification.new do |s|
  s.name        = 'app_component'
  s.version     = '0.0.1'
  s.authors     = ['Volodymyr Byno']
  s.email       = ['volodymyr.byno@gmail.com']
  s.summary     = 'Summary of AppComponent'
  s.description = 'Description of AppComponent'

  s.files = Dir['{app,config,db,lib}/**/*', 'Rakefile']
  s.test_files = Dir['spec/**/*']

  s.add_dependency 'rails'
  s.add_dependency 'rake'
  s.add_dependency 'mini_magick'
  s.add_dependency 'coffee-rails'
  s.add_dependency 'angularjs-rails'
  s.add_dependency 'angular-rails-templates'
  s.add_dependency 'sass'
  s.add_dependency 'money-rails'
  s.add_dependency 'liqpay'
  s.add_dependency 'simple_form'
  s.add_dependency 'ckeditor'
  s.add_dependency 'gmaps4rails'
  s.add_dependency 'bootstrap-datepicker-rails'

  s.add_dependency 'pictures'
  s.add_dependency 'seo_contents'
  s.add_dependency 'core'
  s.add_dependency 'hotels'
  s.add_dependency 'chunks'

  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'fuubar'
  s.add_development_dependency 'pry-rails'
  s.add_development_dependency 'factory_girl'
end
