class RenameArticlesToPages < Mongoid::Migration
  class Article
    include Mongoid::Document
    store_in collection: 'articles'
  end

  class Page
    include Mongoid::Document
    store_in collection: 'pages'
  end

  def self.up
    Mongoid::Clients.default.use('admin').database.command(
      { renameCollection: "#{current_database_name}.articles", to: "#{current_database_name}.pages" }
    )
    Page.update_all(_type: 'Article')
  end

  def self.down
    Article.each { |article| article.unset(:type) }
    Mongoid::Clients.default.use('admin').database.command(
      { renameCollection: "#{current_database_name}.pages", to: "#{current_database_name}.articles" }
    )
  end

  def self.current_database_name
    Mongoid.default_client.options[:database]
  end
end
