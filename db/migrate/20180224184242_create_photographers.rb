class CreatePhotographers < ActiveRecord::Migration[5.1]
  def change
    create_table :photographers do |t|
      t.string :avatar
      t.string :name
      t.datetime :date_join
      t.string :role
      t.string :description
      t.string :phone
      t.string :address

      t.timestamps
    end
  end
end
