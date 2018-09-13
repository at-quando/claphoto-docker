class CreateContractPhotographers < ActiveRecord::Migration[5.1]
  def change
    create_table :contract_photographers do |t|
      t.belongs_to :photographer
      t.belongs_to :contract
      t.float :salary
      
      t.timestamps
    end
  end
end
