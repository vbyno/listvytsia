module Ckeditor
  class PicturePolicy < ApplicationPolicy
    permits :picture

    def index?
      user.present?
    end

    def create?
      user.present?
    end

    def destroy?
      picture.assetable_id == user.id
    end
  end
end
