ActiveAdmin.register Cloth do
  permit_params :name, :hire, :lost, images_attributes: [:name]

  index do
    selectable_column
    id_column
    column :name
    column :hire
    column :lost
    actions
  end

  form(:html => { :multipart => true }) do |f|
    f.inputs 'Plus' do
      f.input :name
      f.input :hire
      f.input :lost
      f.has_many :images do |image|
        image.inputs 'Image', :multipart => true do 
          image.input :name, as: :file
        end
      end
    end
    f.actions
  end
end
