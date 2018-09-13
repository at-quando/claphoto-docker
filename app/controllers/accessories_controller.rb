class AccessoriesController < ApplicationController
  def index
    @accessories = Accessory.all
  end

  def show
    @accessory = Accessory.find(params[:id])
    @accessories = Accessory.all
  end
end
