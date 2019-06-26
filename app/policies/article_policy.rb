class ArticlePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    true
  end

  def edit
    user.article.any?
  end

  def update
    record.writer == user
  end

  def destroy
    record.writer == user
  end
end
