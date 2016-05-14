class MoveDonationToAppComponentNamespace < Mongoid::Migration
  def self.up
    Mongoid::Clients.default.use('admin').database.
      command({
                renameCollection: "listvytsia_#{Rails.env}.donations",
                to:               "listvytsia_#{Rails.env}.app_component_donations"
              })
  end

  def self.down
    Mongoid::Clients.default.use('admin').database.
      command({
                renameCollection: "listvytsia_#{Rails.env}.app_component_donations",
                to:               "listvytsia_#{Rails.env}.donations"
              })

  end
end