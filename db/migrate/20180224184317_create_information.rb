class CreateInformation < ActiveRecord::Migration[5.1]
  def change
    create_table :information do |t|
      t.string :phone
      t.string :address
      t.string :name
      t.string :email
      t.string :description

      t.timestamps
    end
  end
end
