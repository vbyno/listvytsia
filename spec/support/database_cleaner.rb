RSpec.configure do |config|
  # Clean/Reset Mongoid DB prior to running each test.
  config.before(:each) do
    # Temporary fix while database cleaning does not work
    [
      Core::Role,
      Core::Permission,
      AppComponent::Page,
      Core::User,
      Core::Admin
    ].each(&:delete_all)
    # Mongoid::Sessions.default_session.collections.select {|c| c.name !~ /system/ }.each(&:drop)
  end
end