describe Core::User::FindBySocialProvider do
  describe '.call' do
    subject { described_class.(provider_adapter) }

    let(:provider_adapter) { TestProviderAdapter.new }
    let!(:another_user) { create :user }
    let!(:user) { create :user, social_providers: [
                                  uid: provider_adapter.uid,
                                  provider: provider_adapter.provider
                                ] }

    it 'finds appropriate user' do
      expect(subject).to eq user
    end
  end
end
