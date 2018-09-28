ActiveAdmin.register Price do
  permit_params :num_pp, :price

  index do
    selectable_column
    id_column
    column :num_pp
    column :price
    actions
  end

  form do |f|
    f.inputs do
      f.input :num_pp, label: "Number of people"
      f.input :price
    end
    f.actions
  end

end
