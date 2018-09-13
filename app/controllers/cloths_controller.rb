class ClothsController < ApplicationController
  def index
    @articles = Cloth.all
  end

  def show
    @article = Cloth.find(params[:id])
    @articles = Cloth.all
  end
end
