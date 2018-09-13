class CreatePrices < ActiveRecord::Migration[5.1]
  def change
    create_table :prices do |t|
      t.string :num_pp
      t.float :price
      t.float :priceFirst
      t.text :offer
      t.integer :types
      t.integer :aspect
      t.string :takenTime

      t.timestamps
    end
  end
end
