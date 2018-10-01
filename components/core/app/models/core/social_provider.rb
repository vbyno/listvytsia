module Core
  class SocialProvider
    include Mongoid::Document
    include Core::ModelMethods

    embedded_in :user, class_name: 'Core::User'

    field :uid
    field :provider

    validates :uid, presence: true
    validates :provider,
              presence: true,
              inclusion: { in: Core::Social::BaseAdapter::PROVIDERS.values }
  end
end
