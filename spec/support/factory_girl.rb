FactoryGirl.definition_file_paths << 'components/core/spec/factories'
FactoryGirl.definition_file_paths << 'components/app_component/spec/factories'
FactoryGirl.find_definitions

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end
