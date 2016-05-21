require_relative 'asset'

module AppComponent
  module Ckeditor
    class AttachmentFile < Asset
      mount_uploader :data, AppComponent::CkeditorAttachmentFileUploader, mount_on: :data_file_name

      def url_thumb
        @url_thumb ||= ::Ckeditor::Utils.filethumb(filename)
      end
    end
  end
end
