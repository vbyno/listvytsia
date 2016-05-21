class MoveCkeditorAssetToAppComponentNamespace < Mongoid::Migration
  module AppComponent
    module Ckeditor
      class Asset
        include Mongoid::Document
        store_in collection: 'app_component_ckeditor_assets'
      end
    end
  end

  module Ckeditor
    class Asset
      include Mongoid::Document
      store_in collection: 'ckeditor_assets'
    end
  end

  def self.up
    Mongoid::Clients.default.use('admin').database.
      command({
                renameCollection: "listvytsia_#{Rails.env}.ckeditor_assets",
                to:               "listvytsia_#{Rails.env}.app_component_ckeditor_assets"
              })
    AppComponent::Ckeditor::Asset.where(_type: 'Ckeditor::AttachmentFile').
                                  update_all(_type: 'AppComponent::Ckeditor::AttachmentFile')
    AppComponent::Ckeditor::Asset.where(_type: 'Ckeditor::Picture').
                                  update_all(_type: 'AppComponent::Ckeditor::Picture')
  end

  def self.down
    Mongoid::Clients.default.use('admin').database.
      command({
                renameCollection: "listvytsia_#{Rails.env}.app_component_ckeditor_assets",
                to:               "listvytsia_#{Rails.env}.ckeditor_assets"
              })
    Ckeditor::Asset.where(_type: 'AppComponent::Ckeditor::AttachmentFile').
                    update_all(_type: 'Ckeditor::AttachmentFile')
    Ckeditor::Asset.where(_type: 'AppComponent::Ckeditor::Picture').
                    update_all(_type: 'Ckeditor::Picture')
  end
end
