require 'yaml'

module Generators
  mattr_accessor :config_file
  @@config_file = File.expand_path('../generators/generators.yml', __FILE__)

  def self.config
    @@config ||= YAML.load_file(Generators.config_file).fetch('engine')
  end
end

require 'generators/engine_generator' if defined?(:Rails)
