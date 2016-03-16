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

  s.files = Dir["{app,config,db,lib}/**/*", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency 'rails', '4.2.5'
  s.add_dependency 'rake', '10.5.0'
  s.add_dependency 'mongoid', '5.0.2'
end
