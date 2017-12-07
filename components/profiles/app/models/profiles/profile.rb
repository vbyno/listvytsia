module Profiles
  class Profile
    include Mongoid::Document
    include Mongoid::Timestamps

    field :first_name
    field :last_name
    field :published, type: Mongoid::Boolean, default: false

    validates :first_name, :last_name, presence: true

    scope :published, ->{ where(published: true) }
  end
end
