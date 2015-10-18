class FillCreatedAtForExistingArticles < Mongoid::Migration
  def self.up
    time = Time.zone.parse('2015-09-18 16:05:37')

    Article.where(created_at: nil).update_all(created_at: time, update_at: time)
  end
end
