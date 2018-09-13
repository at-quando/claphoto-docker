class AddColumnToContract < ActiveRecord::Migration[5.1]
  def change
    add_column :contracts, :sign, :string
  end
end
