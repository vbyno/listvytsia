module MicroGroups
  class MicroGroupPolicy < ::Core::ApplicationPolicy
    class Scope < Scope
      def resolve
        user.moderator? ? scope.all : scope.published
      end
    end

    permits :micro_group

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
      %i( first_name last_name published )
    end
  end
end
