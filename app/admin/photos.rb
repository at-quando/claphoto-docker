ActiveAdmin.register Photo do
  permit_params :photo, :kind

  index do
    selectable_column
    id_column
    column :photo
    column :kind
    column :created_at
    actions
  end

  form(:html => { :multipart => true }) do |f|
    f.inputs do
      f.inputs "Attachment", :multipart => true do 
        f.input :photo, as: :file
      end
      f.input :kind
      f.input :created_at
    end
    f.actions
  end
end
