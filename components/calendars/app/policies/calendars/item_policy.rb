module Calendars
  class ItemPolicy < ::Core::ApplicationPolicy
    class Scope < Scope
      def resolve
        scope.all
      end
    end

    permits :item

    def index?
      true
    end

    def show?
      true
    end
  end
end
