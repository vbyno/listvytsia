module Core
  class PermissionPresenter < BasePresenter
    presents :permission

    def id
      permission.id.to_s
    end
  end
end
