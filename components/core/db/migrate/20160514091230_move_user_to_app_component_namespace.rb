class MoveUserToAppComponentNamespace < Mongoid::Migration
  def self.up
    Mongoid::Clients.default.use('admin').database.
      command({
                renameCollection: "#{current_database_name}.users",
                to:               "#{current_database_name}.app_component_users"
              })
  end

  def self.down
    Mongoid::Clients.default.use('admin').database.
      command({
                renameCollection: "#{current_database_name}.app_component_users",
                to:               "#{current_database_name}.users"
              })
  end

  def self.current_database_name
    Mongoid.default_client.options[:database]
  end
end
