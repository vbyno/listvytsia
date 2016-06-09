module Hotels
  class Hotel
    include Mongoid::Document
    include Mongoid::Timestamps

    field :link
    field :address
    field :title
    field :phone
    field :price
    field :published, type: Mongoid::Boolean, default: false

    validates :title, :phone, :price, :address, presence: true
  end
end
