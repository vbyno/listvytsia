RSpec.configure do |config|
  config.before(:each) do
    [
      Hotels::Hotel,
    ].each(&:delete_all)
  end
end
