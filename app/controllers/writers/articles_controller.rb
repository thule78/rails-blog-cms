class Writers::ArticlesController < ApplicationController
  def index
    articles = policy_scope(Article).order(created_at: :desc)
    @articles = articles.where(writer: current_user)
  end

  def edit
    @article = Article.find(params[:id])
    authorize @article
  end

  def update

  end

  def destroy
    @article = Article.find(params[:id])
    authorize @article
    @article.destroy

    redirect_to writers_articles_path
  end
end
