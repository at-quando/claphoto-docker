ActiveAdmin.register Message do
permit_params :email, :name, :message

  index do
    selectable_column
    id_column
    column :email
    column :name
    column :message
    actions
  end

  form(:html => { :multipart => true }) do |f|
    f.input :email
    f.input :name
    f.input :message

    f.actions
  end
end
