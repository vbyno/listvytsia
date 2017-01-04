class MoveAdminToAppComponentNamespace < Mongoid::Migration
  def self.up
    Mongoid::Clients.default.use('admin').database.
      command({
                renameCollection: "#{current_database_name}.admins",
                to:               "#{current_database_name}.app_component_admins"
              })
  end

  def self.down
    Mongoid::Clients.default.use('admin').database.
      command({
                renameCollection: "#{current_database_name}.app_component_admins",
                to:               "#{current_database_name}.admins"
              })
  end

  def self.current_database_name
    Mongoid.default_client.options[:database]
  end
end
