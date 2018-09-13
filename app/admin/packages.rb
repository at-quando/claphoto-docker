ActiveAdmin.register Package do
  permit_params :name, :price, :key

  index do
    selectable_column
    id_column
    column :name
    column :price
    column :key
    actions
  end

  form do |f|
    f.inputs do
      f.input  :name, label: 'Name of Package'
      f.input :price
      f.input :key, label: 'keyword of Package'
    end
    f.actions
  end
end
