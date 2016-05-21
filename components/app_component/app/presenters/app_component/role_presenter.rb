module AppComponent
  class RolePresenter < BasePresenter
    presents :role

    def id
      role.id.to_s
    end

    def permissions
      role.permissions.map { |permission| present(permission) }
    end
  end
end
