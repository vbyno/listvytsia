class MoveRoleToAppComponentNamespace < Mongoid::Migration
  def self.up
    Mongoid::Clients.default.use('admin').database.
      command({
                renameCollection: "listvytsia_#{Rails.env}.roles",
                to:               "listvytsia_#{Rails.env}.app_component_roles"
              })
  end

  def self.down
    Mongoid::Clients.default.use('admin').database.
      command({
                renameCollection: "listvytsia_#{Rails.env}.app_component_roles",
                to:               "listvytsia_#{Rails.env}.roles"
              })

  end
end