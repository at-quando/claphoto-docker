class AddDateToContracts < ActiveRecord::Migration[5.1]
  def change
    add_column :contracts, :taken_date_2, :date
  end
end
