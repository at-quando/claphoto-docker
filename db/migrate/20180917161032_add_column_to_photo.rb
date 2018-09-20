class AddColumnToPhoto < ActiveRecord::Migration[5.1]
  def change
    add_column :photos, :desc, :string
    add_reference :photos, :story, index: true
  end
end
