module Pictures
  class Picture
    include ::Mongoid::Document

    belongs_to :page

    mount_uploader :data, PictureUploader, mount_on: :data_file_name

    delegate :url, :current_path, :size, :content_type, :filename, to: :data

    validates :data, presence: true

    scope :by_page_id, ->(page_id) { where(page_id: page_id) }
  end
end
