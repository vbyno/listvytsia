class MoveAdminToAppComponentNamespace < Mongoid::Migration
  def self.up
    Mongoid::Clients.default.use('admin').database.
      command({
                renameCollection: "listvytsia_#{Rails.env}.admins",
                to:               "listvytsia_#{Rails.env}.app_component_admins"
              })
  end

  def self.down
    Mongoid::Clients.default.use('admin').database.
      command({
                renameCollection: "listvytsia_#{Rails.env}.app_component_admins",
                to:               "listvytsia_#{Rails.env}.admins"
              })

  end
end