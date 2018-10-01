require 'spec_helper'

describe Core::Social::GoogleAdapter do
  subject { described_class.new(response) }

  let(:response) do
    OmniAuth::AuthHash.new(
      "provider"=>"google_oauth2",
      "uid"=>"2211685155569484",
      "info"=>
        {"name"=>"Volodymyr Byno",
        "email"=>"volodymyr.byno@gmail.com",
        "first_name"=>"Volodymyr",
        "last_name"=>"Byno",
        "image"=>"https://lh4.googleusercontent.com/-XkfnT2AR7UQ/AAAAAAAAAAI/AAAAAAAAAEw/VukWI7Tilkc/photo.jpg",
        "urls"=>{"google"=>"https://plus.google.com/11273135742343937940748"}},
      "credentials"=>
        {"token"=>
          "ya29.GlwpBmmtF63IlXmY1g_22NSEbR4fJ2lld8iStQ5wuSvC_ec46v6PpN-qNImoyZWAHxrimf4bf0yc_k33mnGOC2s-151TptF9TyadgJJ2Hhptf1B_cAvUdw-IPtSg",
        "expires_at"=>1538369156,
        "expires"=>true},
      "extra"=>
        {
          "id_token"=>
          "eyJhbasfevieSUzI1NiIsImtpZCI6IjY0MWZjMDUzZWY2OGExNDdkNmUwODQ1YWI2OWI5ZDYxYWE0YmM3ODkifQ.eyJpc3MiOiJhY2NvdW50cy5nb29nbGUuY29tIiwiYXpwIjoiNDY5NzUyNzMzMzAtbDdyNmNwZGN0NDcxZTExaGFoYTlzNWNvdGFmcDFjZDkuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJhdWQiOiI0Njk3NTI3MzMzMC1sN3I2Y3BkY3Q0NzFlMTFoYWhhOXM1Y290YWZwMWNkOS5hcHBzLmdvb2dsZXVzZXJjb250ZW50LmNvbSIsInN1YiI6IjExMjczMTM1NzQ2MzkzNzk0MDc0OCIsImVtYWlsIjoidm9sb2R5bXlyLmJ5bm9AZ21haWwuY29tIiwiZW1haWxfdmVyaWZpZWQiOnRydWUsImF0X2hhc2giOiJ0dktmcDdQLUpxcHZpQXhReGNNRlZ3IiwiaWF0IjoxNTM4MzY1NTU3LCJleHAiOjE1MzgzNjkxNTd9.IJU8uUy6L1J93CSpP9U0LTbynGCjFQ37WohDEH20DwDKUi4vMZoihtKuTPRnP0qhmE6sALk6cqHc2IB77eaad6ZtKFXXZ9-Sn4TmOGvIfpIfRRM0HiuRIA1E3vSNoccJMlufbhfhc4g0E1CGgTESp3gTJnTGzAdVTwYyqI6ra8HU-715D8Ewd4o-CPlJSo2iB9kaXcc7Ewhp9xdD2HMzHO9wmSgyRRQE69zJsDJl3tP0AUQ0EFINl_lVfrA-dE_EUKj4n2IXjhVa3E5Y_beWHll4LVe2J0ZSU8riQqxeEUUTCCqe2281qNZ39OTl3IQJV2rMo7LiBTrdIy-iaJPK1Q",
          "id_info"=>
            {
              "iss"=>"accounts.google.com",
              "azp"=>"46975273330-l7r6cpdct471e11haha9s5cotafp1cd9.apps.googleusercontent.com",
              "aud"=>"46975273330-l7r6cpdct471e11haha9s5cotafp1cd9.apps.googleusercontent.com",
              "sub"=>"112731357463937940748",
              "email"=>"volodymyr.byno@gmail.com",
              "email_verified"=>true,
              "at_hash"=>"tvKfp7P-JqpviAxQxcMFVw",
              "iat"=>1538365557,
              "exp"=>1538369157
            },
          "raw_info"=>
            {
              "kind"=>"plus#personOpenIdConnect",
              "gender"=>"male",
              "sub"=>"11273135723437940748",
              "name"=>"Volodymyr Byno",
              "given_name"=>"Volodymyr",
              "family_name"=>"Byno",
              "profile"=>"https://plus.google.com/1127313512363937940748",
              "picture"=>"https://lh4.googleusercontent.com/-XkfnT2AR7UQ/AAAAAAAAAAI/AAAAAAAAAEw/VukWI7Tilkc/photo.jpg?sz=50",
              "email"=>"volodymyr.byno@gmail.com",
              "email_verified"=>"true",
              "locale"=>"en"
            }
        }
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
    it { expect(subject.photo_url).
      to eq 'https://lh4.googleusercontent.com/-XkfnT2AR7UQ/AAAAAAAAAAI/AAAAAAAAAEw/VukWI7Tilkc/photo.jpg' }
  end

  describe '#password' do
    it { expect(subject.password).not_to be_empty }
  end

  describe '#provider' do
    it { expect(subject.provider).to eq 'google' }
  end
end
