class GoogleController < ApplicationController
  def index
  end

  def create 
    #get files in folder
    if params[:password]='123654'
      require 'net/http'
      result = Net::HTTP.get(URI.parse("https://www.googleapis.com/drive/v3/files?q='"+params[:folderId]+"'+in+parents&pageSize=500&key=AIzaSyAI-_o4m_09BXn0HeZV5QW_gMUzq-KaX8I"))
      image_ids = []
      image_names = []
      JSON.parse(result, object_class: OpenStruct).files.each do |image|
        image_ids.push(image.id)
        image_names.push(image.name)
      end
      str_img_ids = image_ids.join(',')
      str_img_names = image_names.join(',')
      viewer = Viewer.where('drive_link LIKE ?', "%#{params[:folderId]}%")[0]
      if Picture.create(pictureId: str_img_ids, name: str_img_names, mimeType: 'image/jpeg', folder: params[:folderId], viewer_id: viewer.id)
        redirect_to google_index_path
        flash[:success] = 'Create Ok!'
      else 
        redirect_to google_index_path
        flash[:success] = 'Cannot Create!'
      end
    else
      redirect_to google_index_path
      flash[:success] = 'Password is not right!'
    end
  end
end
