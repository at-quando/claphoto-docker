class CreateCarts < ActiveRecord::Migration[5.1]
  def change
    create_table :carts do |t|
      t.belongs_to :accessory
      t.belongs_to :contract
      t.integer :quantity
      t.belongs_to :cloth

      t.timestamps
    end
  end
end
