module AppComponent
  module Ckeditor
    class Asset
      include ::Ckeditor::Orm::Mongoid::AssetBase

      delegate :url, :current_path, :size, :content_type, :filename, to: :data

      validates :data, presence: true
    end
  end
end
