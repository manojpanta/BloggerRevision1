class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.create(article_params)
    flash.notice = "Your Article #{@article.title} Was Created!"
    redirect_to article_path(@article)
  end

  def destroy
    @article.destroy
    flash.notice = "Your Article #{@article.title} Was Deleted!"
    redirect_to articles_path
  end

  def edit
  end

  def update
    @article.update(article_params)
    flash.notice = "Your Article #{@article.title} Was Updated!"

    redirect_to article_path(@article)
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
