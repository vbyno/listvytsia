class MoveAdminsToCoreNamespace < Mongoid::Migration
  def self.up
    Mongoid::Clients.default.use('admin').database.
      command({
                renameCollection: "listvytsia_#{Rails.env}.app_component_admins",
                to:               "listvytsia_#{Rails.env}.core_admins"
              })
  end

  def self.down
    Mongoid::Clients.default.use('admin').database.
      command({
                renameCollection: "listvytsia_#{Rails.env}.core_admins",
                to:               "listvytsia_#{Rails.env}.app_component_admins"
              })

  end
end
