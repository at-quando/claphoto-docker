ActiveAdmin.register Plu do
  permit_params :quantity, :price, :total, :contract_id, :content

  index do
    selectable_column
    id_column
    column :contract_id
    column :content
    column :quantity
    column :price
    column :total
    actions
  end

  form(:html => { :multipart => true }) do |f|
    f.inputs 'Article' do
      f.input :contract_id, :as => :select, :collection => Contract.where.not(paid: 1).map{|u| ["#{u.taken_date} -> #{u.group}, #{u.school}, #{u.school_year}", u.id]}
      f.input :content
      f.input :quantity
      f.input :price
      f.input :total
    end
    f.actions
  end
end
