class RolePresenter < BasePresenter
  presents :role

  def id
    role.id.to_s
  end
end
