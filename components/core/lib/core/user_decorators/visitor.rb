module Core
  module UserDecorators
    class Visitor
      include Singleton

      EMPTY_STRING = ''.freeze

      delegate :bson_type, :to_bson, to: :_id

      def _id
        nil
      end

      def permitted_to?(*)
        false
      end

      def moderator?
        false
      end

      def author_of?(*)
        false
      end

      def permission_identifiers
        []
      end

      def email
        EMPTY_STRING
      end

      def registered?
        false
      end
    end
  end
end
