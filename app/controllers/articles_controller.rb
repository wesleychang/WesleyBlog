class ArticlesController < ApplicationController

  before_filter :authorize, except: [:index, :show]

  def index
    @articles = Article.order("published_on DESC").page(params[:page]).per(7)
  end

  def show
    @article = Article.find_by_url(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params[:article])
    if @article.save
      redirect_to @article, notice: "Article has been created!"
    else
      render :new
    end
  end

  def edit
    @article = Article.find_by_url(params[:id])
  end

  def update
    @article = Article.find_by_url(params[:id])
    if @article.update_attributes(params[:article])
      redirect_to @article, notice: "Article has been updated!"
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find_by_url(params[:id])
    @article.destroy
    redirect_to articles_path, notice: "Article has been deleted!"
  end
end
