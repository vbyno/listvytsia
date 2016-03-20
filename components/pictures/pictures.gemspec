# Maintain your gem's version:
require_relative "lib/pictures/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "pictures"
  s.version     = Pictures::VERSION
  s.authors     = ["Volodymyr Byno"]
  s.email       = ["volodymyr.byno@gmail.com"]
  s.summary     = "Summary of Pictures"
  s.description = "Description of Pictures"

  s.files = Dir["{app,config,db,lib}/**/*", "Rakefile"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency 'rails', '4.2.5'
  s.add_dependency 'rake', '10.5.0'
  s.add_dependency 'mongoid', '5.0.2'
  s.add_dependency 'mini_magick', '4.3.6'
  s.add_dependency 'carrierwave-mongoid', '0.8.1'
  s.add_dependency 'coffee-rails', '4.1.1'
  s.add_dependency 'angular-rails-templates', '0.2.0'
  s.add_dependency 'angularjs-rails', '1.5.0'

  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'fuubar'
  s.add_development_dependency 'mongoid-rspec'
end
