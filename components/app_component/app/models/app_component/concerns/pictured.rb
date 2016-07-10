module AppComponent
  module Concerns
    module Pictured
      def picture_url
        return '' unless picture

        picture.data.medium.url
      end

      def picture_content_url
        return '' unless picture

        picture.data.content.url
      end
    end
  end
end
