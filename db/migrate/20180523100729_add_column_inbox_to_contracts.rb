class AddColumnInboxToContracts < ActiveRecord::Migration[5.1]
  def change
    add_column :contracts, :inbox, :string
  end
end
