class MoveUsersToCoreNamespace < Mongoid::Migration
  def self.up
    Mongoid::Clients.default.use('admin').database.
      command({
                renameCollection: "listvytsia_#{Rails.env}.app_component_users",
                to:               "listvytsia_#{Rails.env}.core_users"
              })
  end

  def self.down
    Mongoid::Clients.default.use('admin').database.
      command({
                renameCollection: "listvytsia_#{Rails.env}.core_users",
                to:               "listvytsia_#{Rails.env}.app_component_users"
              })

  end

end
