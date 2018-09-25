class ViewersController < ApplicationController
  def index
    # @image = Cloudinary::Api.resources(:type => :upload, :prefix => "50mmstudio")
  end

  def create 
    if params[:code]
      redirect_to viewer_path(params[:code])
    else
      redirect_to viewers_path
    end
  end

  def show
    @view = Contract.find_by(code: params[:id].downcase)
    if params[:page]
      page = params[:page] - 1
    else 
      page = 0
    end
    if @view
      @link = @view.viewers.find_by(typeFile: 1)
      @pics = @link.pictures
      render json: @view, serializer:  ContractSerializer, meta: {pic: @pics, count: @link.drive_link.split(',').length }
    else
      render status: 404
    end
  end

  def showMobile
    ctr = Contract.find_by(code: params[:id].downcase)
    # if params[:page]
    #   @page = params[:page]
    # else 
    #   @page = 1
    # end
    if ctr
      view = ctr.viewers.where(typeFile: 1)[0]
      pics = Picture.where(viewer_id: view.id)
      return render json: pics
    else
      return render json: { error: 'Cannot find!' }
    end
  end
end
