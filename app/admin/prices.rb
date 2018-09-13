ActiveAdmin.register Price do
  permit_params :num_pp, :price, :num_pg

  index do
    selectable_column
    id_column
    column :num_pp
    column :price
    column :num_pg
    actions
  end

  form do |f|
    f.inputs do
      f.input :num_pp, label: "Number of people"
      f.input :price
      f.input :num_pg, label: "Number of photograher"
    end
    f.actions
  end

end
