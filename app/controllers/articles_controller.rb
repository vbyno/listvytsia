class ArticlesController < ApplicationController
  helper_method :articles, :article

  def index; end
  def show; end
  def edit; end

  def new
    @article ||= Article.new
  end

  def create
    if article.save
      redirect_to edit_article_path(article), notice: t('.success')
    else
      render :new
    end
  end

  def update
    if article.update_attributes(article_params)
      redirect_to edit_article_path(article.reload), notice: t('.success')
    else
      render :edit
    end
  end

  private

  def articles
    @articles ||= Article.scoped
  end

  def article
    @article ||= if params[:id]
      articles.find_by(permalink: params[:id])
    else
      articles.new(article_params)
    end
  end

  def article_params
    params.require(:article).permit(:article_id, :permalink, :title, :content, :active)
  end
end