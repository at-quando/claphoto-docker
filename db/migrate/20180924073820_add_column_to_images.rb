class AddColumnToImages < ActiveRecord::Migration[5.1]
  def change
    add_column :cloths, :parent_id, :integer
    add_reference :images, :cloth, foreign_key: true
  end
end
