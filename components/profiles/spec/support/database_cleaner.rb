RSpec.configure do |config|
  config.before(:each) do
    [
      Profiles::Profile,
    ].each(&:delete_all)
  end
end
