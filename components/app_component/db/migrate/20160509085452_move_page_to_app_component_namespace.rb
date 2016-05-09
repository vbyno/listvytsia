class MovePageToAppComponentNamespace < Mongoid::Migration
  def self.up
    Mongoid::Clients.default.use('admin').database.
      command({
                renameCollection: "listvytsia_#{Rails.env}.pages",
                to:               "listvytsia_#{Rails.env}.app_component_pages"
              })
  end

  def self.down
    Mongoid::Clients.default.use('admin').database.
      command({
                renameCollection: "listvytsia_#{Rails.env}.app_component_pages",
                to:               "listvytsia_#{Rails.env}.pages"
              })

  end
end