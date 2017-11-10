RSpec.configure do |config|
  config.before(:each) do
    [
      MicroGroups::MicroGroup,
      MicroGroups::Region,
    ].each(&:delete_all)
  end
end
