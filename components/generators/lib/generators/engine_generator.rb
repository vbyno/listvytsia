require 'rails/generators'
require 'rails/generators/named_base'
require 'rails/generators/actions'

module Generators
  class EngineGenerator < Rails::Generators::NamedBase
    delegate :config, to: :Generators

    source_root File.expand_path('../templates/engine', __FILE__)

    def copy_files
      {
        'Gemfile' => 'Gemfile',
        'Rakefile' => 'Rakefile',
        'README.rdoc' => 'README.rdoc',
        'gemspec' => "#{ file_name }.gemspec",
        '_test.sh' => 'test.sh',
        'lib/my_engine.rb' => "lib/#{ file_name }.rb",
        'lib/my_engine/engine.rb' => "lib/#{ file_name }/engine.rb",
        'lib/my_engine/version.rb' => "lib/#{ file_name }/version.rb",
        'config/routes.rb' => 'config/routes.rb',
        'bin/rails' => 'bin/rails',
        'spec/models/my_engine_model_spec.rb' => "spec/models/#{ file_name.singularize }_spec.rb",
        'app/models/my_engine/my_engine_model.rb' => "app/models/#{ file_name }/#{ file_name.singularize }.rb",
        'spec/spec_helper.rb' => 'spec/spec_helper.rb'
      }.each_pair { |name, new_name| copy_as_template(name, new_name) }

      Dir.glob("lib/templates/engine/spec/dummy/**/*").each do |name|
        next unless File.file?(name)

        new_name = name.partition('engine/').last
        copy_as_template(new_name, new_name)
      end
    end

    private

    def copy_as_template(original_file_name, new_file_name)
      template original_file_name, "#{ engines_dir }/#{ file_name }/#{ new_file_name }"
    end

    def engines_dir
      config.fetch('directory_name')
    end

    def author
      OpenStruct.new(config.fetch('author'))
    end
  end
end
