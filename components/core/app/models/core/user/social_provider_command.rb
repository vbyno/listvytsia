class Core::User::SocialProviderCommand
  def self.call(*args)
    new(*args).call
  end

  attr_reader :provider_adapter

  def initialize(provider_adapter)
    @provider_adapter = provider_adapter
  end

  def call
    raise NotImplementedError
  end
end
