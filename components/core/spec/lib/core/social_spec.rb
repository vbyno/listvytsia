describe Core::Social do
  describe '.build_adapter' do
    subject { described_class.build_adapter(response) }

    context 'facebook' do
      let(:response) { double(provider: 'facebook') }

      it 'builds facebook adapter' do
        expect(subject).to be_instance_of Core::Social::FacebookAdapter
      end
    end

    context 'google' do
      let(:response) { double(provider: 'google_oauth2') }

      it 'builds google adapter' do
        expect(subject).to be_instance_of Core::Social::GoogleAdapter
      end
    end
  end
end
