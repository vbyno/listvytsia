require 'spec_helper'

describe Core::Social::FacebookAdapter do
  subject { described_class.new(response) }

  let(:response) do
    OmniAuth::AuthHash.new(
      "provider"=>"facebook",
      "uid"=>"2211685155569484",
      "info"=>
       {"email"=>"volodymyr.byno@gmail.com",
        "name"=>"Volodymyr Byno",
        "image"=>"http://graph.facebook.com/v2.6/2211685155569488/picture"},
      "credentials"=>
       {"token"=>
         "EAAhxN0zIyBQBANgS1cHp4TOG8zOHskAKlwZBWeJACEGSWST3zuUssWniD3T11dEUs9SshS85VenBPc1rUmHGQzEbBwBFaXqSdXYMEaKnO1Menk2bUs2fOyl89DNW4Jxox4oMAzp6kfdwRxAqXVu4kFj5aEeAhEH3Hd549AgZDZD",
        "expires_at"=>1543518419,
        "expires"=>true},
      "extra"=>{"raw_info"=>{"name"=>"Volodymyr Byno", "email"=>"volodymyr.byno@gmail.com", "id"=>"2211685155569484"}}
    )
  end

  describe '#email' do
    it { expect(subject.email).to eq 'volodymyr.byno@gmail.com' }
  end

  describe '#first_name' do
    it { expect(subject.first_name).to eq 'Volodymyr' }
  end

  describe '#last_name' do
    it { expect(subject.last_name).to eq 'Byno' }
  end

  describe '#uid' do
    it { expect(subject.uid).to eq '2211685155569484' }
  end

  describe '#photo_url' do
    it { expect(subject.photo_url).to eq 'http://graph.facebook.com/v2.6/2211685155569488/picture' }
  end

  describe '#password' do
    it { expect(subject.password).not_to be_empty }
  end

  describe '#provider' do
    it { expect(subject.provider).to eq 'facebook' }
  end
end
