class ClothsController < ApplicationController
  def index
    @clothes = Cloth.where(parent_id: nil).includes(:images)
    render json: @clothes, include: [:images]
  end

  def show
    @cloth = Cloth.where('id=? OR parent_id=?', params[:id], params[:id]).includes(:images)
    render json: @cloth, include: [:images]
  end

  def related_clothes
    @cloth = Cloth.where.not(id: params[:id]).limit(5).includes(:images)
    render json: @cloth, include: [:images]
  end
end
