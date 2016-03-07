class ArticlePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user.moderator? ? scope.all : scope.for_user(user)
    end
  end

  permits :article

  def index?
    true
  end

  def show?
    user.moderator? || article.published? || user.author_of?(article)
  end

  def create?
    user.permitted_to?(:create, :articles)
  end

  def update?
    user.moderator? || (user.author_of?(article) && user.permitted_to?(:update, :articles))
  end

  def permitted_attributes
    attributes = %i( permalink title content content_intro published picture_id )
    attributes.push(:author_id) if user.moderator?
    attributes.push(seo_content_attributes: [:title, :description, :keywords])

    attributes
  end
end
