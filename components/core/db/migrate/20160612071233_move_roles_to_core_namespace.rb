class MoveRolesToCoreNamespace < Mongoid::Migration
  def self.up
    Mongoid::Clients.default.use('admin').database.
      command({
                renameCollection: "#{current_database_name}.app_component_roles",
                to:               "#{current_database_name}.core_roles"
              })
  end

  def self.down
    Mongoid::Clients.default.use('admin').database.
      command({
                renameCollection: "#{current_database_name}.core_roles",
                to:               "#{current_database_name}.app_component_roles"
              })

  end

  def self.current_database_name
    Mongoid.default_client.options[:database]
  end
end
