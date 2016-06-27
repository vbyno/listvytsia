module Core
  class UserPresenter < BasePresenter
    presents :user

    def id
      user.id.to_s
    end

    def role_ids
      user.role_ids.map(&:to_s)
    end
  end
end
