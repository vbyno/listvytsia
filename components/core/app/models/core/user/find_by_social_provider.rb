class Core::User::FindBySocialProvider < Core::User::SocialProviderCommand
  def call
    Core::User.where(
      'social_providers.provider' => provider_adapter.provider,
      'social_providers.uid' => provider_adapter.uid
    ).first
  end
end
