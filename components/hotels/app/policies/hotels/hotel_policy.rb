module Hotels
  class HotelPolicy < ::Core::ApplicationPolicy
    class Scope < Scope
      def resolve
        user.moderator? ? scope.all : scope.published
      end
    end

    permits :hotel

    def index?
      true
    end

    def show?; end

    def create?
      user.moderator?
    end

    def update?
      user.moderator?
    end

    def permitted_attributes
      %i( link address title phone price published )
    end
  end
end
