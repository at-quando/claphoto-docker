class AddColumnContractPhotographers < ActiveRecord::Migration[5.1]
  def change
    add_column :contract_photographers, :finishImages, :boolean, default: 0
  end
end
