module MicroGroups
  class MicroGroupPolicy < ::Core::ApplicationPolicy
    class Scope < Scope
      def resolve
        scope.all
      end
    end

    permits :micro_group

    def index?
      true
    end

    def show?
      true
    end
  end
end
