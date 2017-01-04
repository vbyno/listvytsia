class MoveDonationToAppComponentNamespace < Mongoid::Migration
  def self.up
    return unless Mongoid.default_client.collections.map(&:name).include?('donations')

    Mongoid::Clients.default.use('admin').database.
      command({
                renameCollection: "#{current_database_name}.donations",
                to:               "#{current_database_name}.app_component_donations"
              })
  end

  def self.down
    Mongoid::Clients.default.use('admin').database.
      command({
                renameCollection: "#{current_database_name}.app_component_donations",
                to:               "#{current_database_name}.donations"
              })

  end

  def self.current_database_name
    Mongoid.default_client.options[:database]
  end
end
