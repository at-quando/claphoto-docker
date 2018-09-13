class AddColumnToContracts1 < ActiveRecord::Migration[5.1]
  def change
    add_column :contracts, :video, :boolean
  end
end
