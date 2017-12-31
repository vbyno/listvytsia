describe Calendars::Item, type: :model do
  it { is_expected.to validate_presence_of :city }
end
