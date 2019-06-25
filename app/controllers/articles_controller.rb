class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @articles = policy_scope(Article).order(created_at: :desc)
  end

  def show
    @article = Article.find(params[:id])
    authorize @article
  end

  def new
    @article = current_user.articles.new
    authorize @article
  end

  def create
    @article = current_user.articles.new(article_params)
    authorize @article
    if @article.save
      redirect_to articles_path
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
    authorize @article
  end

  def update
    @article = Article.find(params[:id])
    authorize @article
    @article.update(article_params)
    redirect_to article_path(article)
  end

  def destroy
    @article = Article.find(params[:id])
    authorize @article
    @article.destroy
    redirect_to articles_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :content, :photo, :photo1, :photo2)
  end
end
