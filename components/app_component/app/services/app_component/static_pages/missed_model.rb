module AppComponent
  module StaticPages
    class MissedModel
      include Singleton

      def title
        ''
      end

      def content
        ''
      end
    end
  end
end