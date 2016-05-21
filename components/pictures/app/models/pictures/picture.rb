module Pictures
  class Picture
    include ::Mongoid::Document
    include Mongoid::Timestamps

    field :page_id
    field :alt
    field :title
    mount_uploader :data, PictureUploader, mount_on: :data_file_name

    delegate :url, :current_path, :size, :content_type, :filename, to: :data

    validates :data, :page_id, presence: true

    scope :by_page_id, ->(page_id) { where(page_id: page_id) }

    def thumb_url
      data.thumb.url
    end
  end
end
