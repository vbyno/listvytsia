class Core::User::FindByEmailAndAddProvider < Core::User::SocialProviderCommand
  def call
    user = Core::User.by_email(provider_adapter.email).first

    return unless user

    user.social_providers.create!(
      provider: provider_adapter.provider,
      uid: provider_adapter.uid
    )

    user.confirm

    if user.profile.nil?
      user.create_profile(
        first_name: provider_adapter.first_name,
        last_name: provider_adapter.last_name,
        photo_url: provider_adapter.photo_url
      )
    end

    user
  end
end
