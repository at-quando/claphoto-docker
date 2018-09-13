class AddColumntoClothes < ActiveRecord::Migration[5.1]
  def change
    add_column :cloths, :funds, :float, default: 0
  end
end
