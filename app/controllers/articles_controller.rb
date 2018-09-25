class ArticlesController < ApplicationController
  require 'net/http'
  
  def index
    if request.path == '/posing'
      @articles = Article.all.where(kind: 1)
      @article = Article.find_by(kind: 1, favorite: 1)
      @articles_rand= Article.order("RAND()").limit(6)
    elsif request.path == '/clothes'
      @articles = Article.all.where(kind: 0)
      @article = Article.find_by(kind: 0, favorite: 1)
      @articles_rand = Article.order("RAND()").limit(6)
    elsif request.path == '/ask'
      @articles = Article.all.where(kind: 3)
      @article = Article.find_by(kind: 3, favorite: 1)
      @articles_rand= Article.order("RAND()").limit(6)
    elsif request.path == '/concept'
      @articles = Article.all.where(kind: 2)
      @article = Article.find_by(kind: 2, favorite: 1)
      @articles_rand= Article.order("RAND()").limit(6)
    else 
      @articles = Article.all
    end
  end

  def index_article
    @articles = Article.all.where(kind: params[:kind]).includes(:images)
    render json: @articles, include: [:images]
  end

  def show
    @article = Article.find(params[:id])
    render json: @article, include: [:images]
  end

  def show_related
    @articles_rand = Article.where(kind: params[:kind]).order("RAND()").limit(3)
    render json: @articles_rand, include: [:images]
  end

  def show_rand
    @articles_rand = Article.order("RAND()").limit(8)
    render json: @articles_rand, include: [:images]
  end

  def show_rand_except
    @articles_rand = Article.where.not(kind: 0).order("RAND()").limit(8)
    render json: @articles_rand, include: [:images]
  end

  def show_product
    @product = Photo.where(kind: params[:kind])
    render json: @product
  end

  def show_main_article
    @article = Article.find(32)
    render json: @article, include: [:images]
  end
  
  def hot_costume
    @articles = Article.joins(:images).where(kind: 0).includes(:images)
    render json: @articles, include: [:images]
  end
end
