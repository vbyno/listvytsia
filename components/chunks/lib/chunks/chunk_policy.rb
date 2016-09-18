module Chunks
  class ChunkPolicy < Core::ApplicationPolicy
    class Scope < Scope
      def resolve
        scope.all
      end
    end

    permits :chunk

    def index?
      user.moderator?
    end

    def show?
      true
    end

    def create?
      user.moderator?
    end

    def update?
      user.moderator?
    end

    def permitted_attributes
      %i( :identifier, :body )
    end
  end
end
