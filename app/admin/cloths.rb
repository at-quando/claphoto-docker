ActiveAdmin.register Cloth do
  permit_params :name, :hire, :lost

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
    end
    f.actions
  end
end
