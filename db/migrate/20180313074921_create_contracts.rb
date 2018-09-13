class CreateContracts < ActiveRecord::Migration[5.1]
  def change
    create_table :contracts do |t|
      t.string :name
      t.string :phone
      t.string :school
      t.string :school_year
      t.string :address
      t.string :town
      t.string :group
      t.date :taken_date
      t.integer :num_pp
      t.belongs_to :price
      t.string :package
      t.float :deposit
      t.string :prepare
      t.string :gift
      t.string :code

      t.timestamps
    end
  end
end
