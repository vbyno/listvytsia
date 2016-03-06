class RenameArticlesToPages < Mongoid::Migration
  def self.up
    Page.update_all(_type: 'Article')
  end

  def self.down
    Article.each { |article| article.unset(:type) }
  end
end
