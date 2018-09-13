class UploadController < ActionController::Base

  def access_file
    if File.exists?(Rails.root.join("public", "uploads", "files", params[:name]))
      send_data File.read(Rails.root.join("public", "uploads", "files", params[:name])), :disposition => "attachment"
    else
      render :nothing => true
    end
  end

  def upload_image
    if params
      FileUtils::mkdir_p(Rails.root.join("public/uploads/files"))
      ext = File.extname(params[:image_param].original_filename)
      file_name = "#{SecureRandom.urlsafe_base64}#{ext}"
      path = Rails.root.join("public/uploads/files/", file_name)
 
      File.open(path, "wb") {|f| f.write(params[:image_param].read)}
      view_file = Rails.root.join("/download_file/", file_name).to_s
      render :json => {:link => view_file}.to_json
    else
      render :text => {:link => nil}.to_json
    end
  end
end