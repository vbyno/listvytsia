module MicroGroups
  class RegionPolicy < ::Core::ApplicationPolicy
    class Scope < Scope
      def resolve
        user.moderator? ? scope.all : scope.published
      end
    end

    permits :region

    def index?
      true
    end

    def show?
      true
    end
  end
end
