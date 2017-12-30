RSpec.configure do |config|
  config.before(:each) do
    [
      Calendars::Item,
    ].each(&:delete_all)
  end
end
