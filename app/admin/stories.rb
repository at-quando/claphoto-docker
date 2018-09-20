ActiveAdmin.register Story do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  permit_params :title, :cover, :desc, { photos: [] }

  index do
    selectable_column
    id_column
    column :title
    column :cover
    column :desc
    actions
  end

  form(:html => { :multipart => true }) do |f|
    f.inputs do
      f.input :title
      f.inputs "Attachment", :multipart => true do 
        f.input :cover, as: :file
      end
      f.input :desc
      f.file_field :photos, multiple: true
    end
    f.actions
  end
end
