class Core::User::CreateBySocialProvider < Core::User::SocialProviderCommand
  def call
    user = Core::User.new(
      email:      provider_adapter.email,
      password:   provider_adapter.password,
      profile: {
        first_name: provider_adapter.first_name,
        last_name:  provider_adapter.last_name,
        photo_url:  provider_adapter.photo_url
      }
    )

    user.social_providers.build(
      uid: provider_adapter.uid,
      provider: provider_adapter.provider
    )

    user.skip_confirmation!
    user.save!

    user
  end
end
