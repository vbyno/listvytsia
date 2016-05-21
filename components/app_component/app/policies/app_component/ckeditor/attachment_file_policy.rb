module AppComponent
  module Ckeditor
    class AttachmentFilePolicy < ::AppComponent::ApplicationPolicy
      permits :attachment

      def index?
        user.present?
      end

      def create?
        user.present?
      end

      def destroy?
        attachment.assetable_id == user.id
      end
    end
  end
end
