module Pictures
  class Picture
    include ::Mongoid::Document

    mount_uploader :data, PictureUploader, mount_on: :data_file_name

    delegate :url, :current_path, :size, :content_type, :filename, to: :data

    validates :data, presence: true
  end
end
