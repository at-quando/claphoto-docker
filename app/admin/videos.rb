ActiveAdmin.register Video do
  permit_params :video, :kind

  index do
    selectable_column
    id_column
    column :video
    column :kind
    actions
  end

  form(:html => { :multipart => true }) do |f|
    f.input :video
    f.input :kind
    f.actions
  end
end
