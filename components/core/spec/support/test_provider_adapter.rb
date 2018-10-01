class TestProviderAdapter
  extend Dry::Initializer

  option :uid,        default: proc { '123456789' }
  option :provider,   default: proc { 'facebook' }
  option :first_name, default: proc { 'TestFirstName' }
  option :last_name,  default: proc { 'TestLastName' }
  option :email,      default: proc { 'test@mail.comx' }
  option :password,   default: proc { 'password' }
  option :photo_url,  default: proc { 'https://photo.jpeg' }
end
