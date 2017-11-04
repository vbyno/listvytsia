RSpec.configure do |config|
  config.before(:each) do
    [
      MicroGroups::MicroGroup,
    ].each(&:delete_all)
  end
end
