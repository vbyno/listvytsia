module Events
  class EventPolicy < ::Core::ApplicationPolicy
    class Scope < Scope
      def resolve
        scope.all
      end
    end

    permits :event

    def index?
      true
    end

    def show?
      true
    end
  end
end
