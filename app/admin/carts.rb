ActiveAdmin.register Cart do
  permit_params :accessory_id, :quantity, :cloth_id, :contract_id

  index do
    selectable_column
    id_column
    column 'Link' do |member|
      link_to("#{member.contract.name} - #{member.contract.group}, #{member.contract.school}, #{member.contract.school_year}", "../contracts/#{member.contract_id}?code=#{member.contract.code}").html_safe
    end
    column 'Trang phục' do |member|
      link_to("#{member.cloth.name}", "#").html_safe
    end
    column :quantity
    column :contract_id
    column :accessory_id
    column :cloth_id
    actions
  end

  form(:html => { :multipart => true }) do |f|
    f.inputs 'Plus' do
      f.input :contract_id, :as => :select, :collection => Contract.all.map{|u| ["#{u.taken_date} -> #{u.group}, #{u.school}, #{u.school_year}", u.id]}
      f.input :accessory_id, :as => :select, :collection => Accessory.all.map{|u| ["#{u.name}, #{u.price}", u.id]}
      f.input :cloth_id, :as => :select, :collection => Cloth.all.map{|u| ["#{u.name}, #{u.hire}", u.id]}
      f.input :quantity
    end
    f.actions
  end
end