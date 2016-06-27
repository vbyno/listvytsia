class MoveRolesToCoreNamespace < Mongoid::Migration
  def self.up
    Mongoid::Clients.default.use('admin').database.
      command({
                renameCollection: "listvytsia_#{Rails.env}.app_component_roles",
                to:               "listvytsia_#{Rails.env}.core_roles"
              })
  end

  def self.down
    Mongoid::Clients.default.use('admin').database.
      command({
                renameCollection: "listvytsia_#{Rails.env}.core_roles",
                to:               "listvytsia_#{Rails.env}.app_component_roles"
              })

  end
end
