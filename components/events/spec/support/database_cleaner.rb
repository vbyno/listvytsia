RSpec.configure do |config|
  config.before(:each) do
    [
      Events::Event,
    ].each(&:delete_all)
  end
end
