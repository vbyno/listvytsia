# Maintain your gem's version:
require_relative "lib/app_component/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "app_component"
  s.version     = AppComponent::VERSION
  s.authors     = ["Volodymyr Byno"]
  s.email       = ["volodymyr.byno@gmail.com"]
  s.summary     = "Summary of AppComponent"
  s.description = "Description of AppComponent"

  s.files = Dir["{app,config,db,lib}/**/*", "Rakefile"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency 'rake', '10.5.0'
  s.add_dependency 'mini_magick', '4.3.6'
  s.add_dependency 'carrierwave-mongoid', '0.8.1'
  s.add_dependency 'coffee-rails', '4.1.1'
  s.add_dependency 'angularjs-rails', '1.5.0'
  s.add_dependency 'angular-rails-templates', '1.0.0'
  s.add_dependency 'slim-rails', '3.0.1'
  s.add_dependency 'rabl', '0.11.8'
  s.add_dependency 'sass', '3.4.21'
  s.add_dependency 'money-rails', '1.6.0'
  s.add_dependency 'liqpay', '1.0.1'
  s.add_dependency 'simple_form', '3.2.1'
  s.add_dependency 'ckeditor'
  s.add_dependency 'gmaps4rails', '2.1.2'

  s.add_dependency 'pictures'
  s.add_dependency 'seo_contents'
  s.add_dependency 'core'

  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'fuubar'
  s.add_development_dependency 'pry-rails'
  s.add_development_dependency 'mongoid-rspec'
  s.add_development_dependency 'factory_girl'
end
