ActiveAdmin.register Contract do
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
  permit_params :name, :phone, :paid, :scenario, :typeContract, :school, :school_year, :address, :photoshop, :video, :town, :group, :taken_date, :taken_date_2, :num_pp, :price_id, :package, :deposit, :prepare, :gift, :code, plus_attributes: [:id, :content, :quantity, :total], contract_photographers_attributes: [:id, :contract_id , :photographer_id, :salary, :role, :note, :finishImages, :paid], contract_plans_attributes: [:id, :quater, :costume, :place, :prepare], viewers_attributes: [:id, :email, :pwd, :drive_link, :typeFile], carts_attributes: [:id, :accessory_id, :cloth_id, :quantity]

  index do
    selectable_column
    id_column
    column :name
    column :phone
    column :taken_date
    column :typeContract
    column :taken_date_2
    column :code
    column :scenario
    column(:paid) do |check| 
      check.paid? ? status_tag( "yes", :ok ) : status_tag( "no" )
    end
    column(:photoshop) do |check| 
      check.photoshop? ? status_tag( "yes", :ok ) : status_tag( "no" )
    end
    column(:video) do |check| 
      check.video? ? status_tag( "yes", :ok ) : status_tag( "no" )
    end
    column :school
    column :school_year
    column 'Link Contract' do |member|
      link_to("link", "../contracts/#{member.id}?code=#{member.code}").html_safe
    end
    column 'Scription' do |member|
      link_to("link", "../scription/#{member.id}").html_safe
    end
    column :address
    column :town
    column :group
    column :num_pp
    column :price_id
    column :package
    column :deposit
    column :prepare
    column :gift
    actions
  end

  form(:html => { :multipart => true }) do |f|
    f.inputs 'Contract' do
      f.input :name
      f.input :phone
      f.input :school
      f.input :school_year
      f.input :address
      f.input :town
      f.input :group
      f.input :typeContract
      f.input :taken_date
      f.input :taken_date_2
      f.input :num_pp
      f.input :price_id, :as => :select, :collection => Price.all.map{|u| ["#{u.num_pp}, #{u.price}", u.id]}
      f.input :package
      f.input :deposit
      f.input :scenario
      f.input :prepare
      f.input :gift
      f.input :code
      f.input :paid
      f.input :photoshop
      f.input :video
    end
    f.has_many :contract_plans do |plan|
      plan.inputs 'Plan', :multipart => true do 
        plan.input :quater
        plan.input :costume
        plan.input :place
        plan.input :prepare
      end
    end
    f.has_many :carts do |car|
      car.inputs 'Cart', :multipart => true do 
        car.input :accessory_id, :as => :select, :collection => Accessory.all.map{|u| ["#{u.name}, #{u.price}", u.id]}
        car.input :cloth_id, :as => :select, :collection => Cloth.all.map{|v| ["#{v.name}, #{v.hire}", v.id]}
        car.input :quantity
      end
    end
    f.has_many :plus do |plu|
      plu.inputs 'Plus', :multipart => true do 
        plu.input :content
        plu.input :quantity
        plu.input :price
        plu.input :total
      end
    end
    f.has_many :contract_photographers do |co|
      co.inputs 'Photographer', :multipart => true do 
        co.input :photographer_id, :as => :select, :collection => Photographer.all.map{|u| ["#{u.name}, #{u.phone}", u.id]}
        co.input :salary
        co.input :role, :as => :select, :collection => [["Support"], ["Leader"], ["Camera Man"], ["Other"]]
        co.input :note
        co.input :finishImages
        co.input :paid
      end
    end
    f.has_many :viewers do |view|
      view.inputs 'View', :multipart => true do 
        view.input :email
        view.input :pwd
        view.input :drive_link
        view.input :typeFile
      end
    end
    f.actions
  end
end
