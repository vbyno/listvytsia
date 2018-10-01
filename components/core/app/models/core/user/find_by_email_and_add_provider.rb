class Core::User::FindByEmailAndAddProvider < Core::User::SocialProviderCommand
  def call
    user = Core::User.by_email(provider_adapter.email).first

    return unless user

    user.social_providers.create!(
      provider: provider_adapter.provider,
      uid: provider_adapter.uid
    )

    user.confirm

    user
  end
end
