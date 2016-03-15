class RenameArticlesToPages < Mongoid::Migration
  def self.up
    Mongoid::Clients.default.use('admin').database.command({renameCollection: "listvytsia_#{Rails.env}.articles", to: "listvytsia_#{Rails.env}.pages"})
    Page.update_all(_type: 'Article')
  end

  def self.down
    Article.each { |article| article.unset(:type) }
    Mongoid::Clients.default.use('admin').database.command({renameCollection: "listvytsia_#{Rails.env}.pages", to: "listvytsia_#{Rails.env}.articles"})
  end
end
