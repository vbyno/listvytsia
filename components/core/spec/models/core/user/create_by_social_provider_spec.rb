describe Core::User::CreateBySocialProvider do
  describe '.call' do
    subject { described_class.(provider_adapter) }

    let(:provider_adapter) { TestProviderAdapter.new }

    it 'creates appropriate user' do
      expect { subject }.to change { Core::User.count }.by 1

      Core::User.last.tap do |user|
        expect(user.email).to eq provider_adapter.email

        user.social_providers.first.tap do |provider|
          expect(provider.provider).to eq provider_adapter.provider
          expect(provider.uid).to eq provider_adapter.uid
        end

        expect(user.profile.first_name).to eq provider_adapter.first_name
        expect(user.profile.last_name).to eq provider_adapter.last_name
        expect(user.profile.photo_url).to eq provider_adapter.photo_url
        expect(user).to be_confirmed
      end
    end
  end
end
