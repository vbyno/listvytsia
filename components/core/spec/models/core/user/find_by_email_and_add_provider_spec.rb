describe Core::User::FindByEmailAndAddProvider do
  describe '.call' do
    subject { described_class.(provider_adapter) }

    let(:provider_adapter) { TestProviderAdapter.new(email: user.email) }
    let!(:user) { create :user }
    let!(:another_user) { create :user }

    # To prevent FactoryGirl of sending confirmation emails
    before { Core::User.update_all(confirmed_at: nil) }

    it 'adds provider to correct user' do
      expect { subject }
        .to change { user.reload.social_providers&.first }
        .from(nil)
    end

    it 'adds correct provider info' do
      subject

      user.reload.social_providers.first.tap do |provider|
        expect(provider.uid).to eq provider_adapter.uid
        expect(provider.provider).to eq provider_adapter.provider
      end
    end

    it 'adds correct profile info' do
      expect { subject }.to change { user.reload.profile }.from(nil)
    end

    it 'confirms user' do
      expect { subject }.to change { user.reload.confirmed? }.from(false).to(true)
    end
  end
end
