require_relative 'asset'

module AppComponent
  module Ckeditor
    class Picture < Asset
      mount_uploader :data, AppComponent::CkeditorPictureUploader, mount_on: :data_file_name

      def url_content
        url(:content)
      end
    end
  end
end
