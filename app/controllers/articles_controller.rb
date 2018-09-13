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

  def index_costume
    @articles = Article.all.where(kind: 0).includes(:images)
    render json: @articles, include: [:images]
  end

  def index_concept
    @articles = Article.all.where(kind: 2).includes(:images)
    render json: @articles, include: [:images]
  end

  def index_posing
    @articles = Article.all.where(kind: 1).includes(:images)
    render json: @articles, include: [:images]
  end

  def show
    @article = Article.find(params[:id])
    @articles_rand = Article.order("RAND()")
  end
  
  def hot_costume
    @articles = Article.joins(:images).where(kind: 0).includes(:images)
    render json: @articles, include: [:images]
  end
end
