class TestProviderAdapter < Core::Social::BaseAdapter
  def initialize(
    uid: '123456789',
    provider: 'facebook',
    first_name: 'TestFirstName',
    last_name: 'TestLastName',
    email: 'test@mail.comx',
    photo_url: 'https://photo.jpeg'
  )
    @uid = uid
    @provider = provider
    @first_name = first_name
    @last_name = last_name
    @email = email
    @photo_url = photo_url
  end

  attr_reader :uid, :provider, :first_name, :last_name, :email, :photo_url
end
