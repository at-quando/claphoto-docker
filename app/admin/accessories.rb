ActiveAdmin.register Accessory do
  permit_params :name, :price

  index do
    selectable_column
    id_column
    column :name
    column :price
    actions
  end

  form(:html => { :multipart => true }) do |f|
    f.inputs 'Accessories' do
      f.input :name
      f.input :price
    end
    f.actions
  end
end
