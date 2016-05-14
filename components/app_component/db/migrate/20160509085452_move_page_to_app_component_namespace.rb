class MovePageToAppComponentNamespace < Mongoid::Migration
  module AppComponent
    class Page
      include Mongoid::Document
      store_in collection: 'app_component_pages'
    end
  end

  class Page
    include Mongoid::Document
    store_in collection: 'pages'
  end

  def self.up
    Mongoid::Clients.default.use('admin').database.
      command({
                renameCollection: "listvytsia_#{Rails.env}.pages",
                to:               "listvytsia_#{Rails.env}.app_component_pages"
              })

    AppComponent::Page.where(_type: 'StaticPage').update_all(_type: 'AppComponent::StaticPage')
    AppComponent::Page.where(_type: 'Event').update_all(_type: 'AppComponent::Event')
    AppComponent::Page.where(_type: 'Article').update_all(_type: 'AppComponent::Article')
  end

  def self.down
    Mongoid::Clients.default.use('admin').database.
      command({
                renameCollection: "listvytsia_#{Rails.env}.app_component_pages",
                to:               "listvytsia_#{Rails.env}.pages"
              })

    Page.where(_type: 'AppComponent::StaticPage').update_all(_type: 'StaticPage')
    Page.where(_type: 'AppComponent::Event').update_all(_type: 'Event')
    Page.where(_type: 'AppComponent::Article').update_all(_type: 'Article')
  end
end
