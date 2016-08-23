module Core
  module UserDecorators
    class User
      attr_reader :permission_identifiers, :_id

      delegate :bson_type, :to_bson, to: :_id

      def initialize(user)
        @_id = user.id
        @permission_identifiers = user.roles.map(&:permissions).flatten
      end

      def permitted_to?(action, resource)
        permission_identifiers.any? do |p|
          p.action.to_sym == action &&
          p.resource.to_sym == resource
        end
      end

      def moderator?
        permitted_to?(:moderate, :articles)
      end

      def author_of?(resource, via: :author_id)
        _id == resource.public_send(via)
      end
    end
  end
end
