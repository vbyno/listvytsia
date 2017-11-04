describe MicroGroups::MicroGroup, type: :model do
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :city }
end
