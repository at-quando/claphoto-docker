ActiveAdmin.register Photographer do
  permit_params :avatar, :name, :date_join, :role, :description, :phone, :address, :favorite

  index do
    selectable_column
    id_column
    column :avatar
    column :name
    column :date_join
    column :role
    column :description
    column :phone
    column 'Normal Link' do |member|
      link_to("link", "../photographers/#{member.id}").html_safe
    end
    column 'Admin Link' do |member|
      token = AdminSecret.find(1)
      link_to("link", "../photographers/#{member.id}?token=#{token.token_secret}").html_safe
    end
    column :address
    column(:favorite) do |check| 
      check.favorite? ? status_tag( "yes", :ok ) : status_tag( "no" )
    end
    actions
  end

  form(:html => { :multipart => true }) do |f|
    f.inputs do
      f.inputs "Attachment", :multipart => true do 
        f.input :avatar, as: :file
      end
      f.input :name
      f.input :date_join
      f.input :role
      f.input :description
      f.input :phone
      f.input :address
      f.input :favorite
    end
    f.actions
  end

end
