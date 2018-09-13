class AddColumnToCloths < ActiveRecord::Migration[5.1]
  def change
    add_column :cloths, :quantity, :integer
  end
end
