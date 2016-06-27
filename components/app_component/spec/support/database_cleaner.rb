RSpec.configure do |config|
  # Clean/Reset Mongoid DB prior to running each test.
  config.before(:each) do
    # Temporary fix while database cleaning does not work
    [
      AppComponent::Page,
      Core::Admin,
      Core::User,
      Core::Permission,
      Core::Role
    ].each(&:delete_all)
    # Mongoid::Sessions.default_session.collections.select {|c| c.name !~ /system/ }.each(&:drop)
  end
end