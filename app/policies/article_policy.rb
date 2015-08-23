class ArticlePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(active: true)
    end
  end

  alias_method :article, :record

  def index?
    true
  end

  def show?
    article.active? || article.author?(user)
  end

  def create?
    user.permitted_to?(:create, :articles)
  end

  def update?
    article.author?(user) && user.permitted_to?(:update, :articles)
  end
end
