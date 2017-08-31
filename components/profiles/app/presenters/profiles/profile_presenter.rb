module Profiles
  class ProfilePresenter < Core::BasePresenter
    presents :profile

    def id
      profile.id.to_s
    end
  end
end
