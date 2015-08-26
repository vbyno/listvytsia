class ArticlePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(published: true)
    end
  end

  alias_method :article, :record

  def index?
    true
  end

  def show?
    article.published? || article.author?(user)
  end

  def create?
    user.permitted_to?(:create, :articles)
  end

  def update?
    article.author?(user) && user.permitted_to?(:update, :articles)
  end
end
