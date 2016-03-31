module Pictures
  class Picture
    include ::Mongoid::Document
    include Mongoid::Timestamps

    field :page_id
    mount_uploader :data, PictureUploader, mount_on: :data_file_name

    delegate :url, :current_path, :size, :content_type, :filename, to: :data

    validates :data, :page_id,  presence: true

    scope :by_page_id, ->(page_id) { where(page_id: page_id) }
  end
end
