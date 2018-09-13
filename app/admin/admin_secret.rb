ActiveAdmin.register AdminSecret do
  permit_params :token_secret

  index do
    selectable_column
    id_column
    column :token_secret
    column 'Schedule' do |member|
      token = AdminSecret.find(1)
      link_to("link", "../schedule?token=#{token.token_secret}").html_safe
    end
    actions
  end

  filter :token_secret

  form do |f|
    f.inputs do
      f.input :token_secret
    end
    f.actions
  end
end
