class CreatePlus < ActiveRecord::Migration[5.1]
  def change
    create_table :plus do |t|
      t.string :content
      t.integer :quantity 
      t.float :price
      t.float :total
      t.belongs_to :contract

      t.timestamps
    end
  end
end

