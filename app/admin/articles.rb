ActiveAdmin.register Article do
  permit_params :content, :url, :description, :kind, :title, :key, images_attributes: [:name]

  index do
    selectable_column
    id_column
    column :title
    column :content
    column :description
    column :kind
    column :key
    column :url
    actions
  end

  form(:html => { :multipart => true }) do |f|
    f.inputs 'Article' do
      f.input :title
      f.input :description
      f.input :content
      f.input :kind
      f.input :key
      f.input :url
    end
    unless !f.object.new_record?
      f.has_many :images do |image|
        image.inputs 'Image', :multipart => true do 
          image.input :name, as: :file
        end
      end
    end

    f.actions
  end
end
