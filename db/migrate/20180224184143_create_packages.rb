class CreatePackages < ActiveRecord::Migration[5.1]
  def change
    create_table :packages do |t|
      t.string :name
      t.float :price
      t.string :key
      
      t.timestamps
    end
  end
end
