describe Events::Event, type: :model do
  it { is_expected.to validate_presence_of :city }
end
