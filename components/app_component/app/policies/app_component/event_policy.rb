module AppComponent
  class EventPolicy < Core::ApplicationPolicy
    class Scope < Scope
      def resolve
        user.permitted_to?(:moderate, :events) ? scope.all : scope.for_user(user)
      end
    end

    permits :event_page

    def index?
      true
    end

    def show?
      user.permitted_to?(:moderate, :events) || event_page.published? || user.author_of?(event_page)
    end

    def create?
      user.permitted_to?(:create, :events)
    end

    def update?
      user.moderator? || (user.author_of?(event_page) && user.permitted_to?(:update, :events))
    end

    def permitted_attributes
      attributes = %i( permalink title content content_intro published picture_id )
      attributes.push(:author_id) if user.permitted_to?(:moderate, :events)
      attributes.push(seo_content_attributes: [:title, :description, :keywords])

      attributes
    end
  end
end
