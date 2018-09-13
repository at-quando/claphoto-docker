class CreateContractPlans < ActiveRecord::Migration[5.1]
  def change
    create_table :contract_plans do |t|
      t.string :quater
      t.string :costume
      t.string :place
      t.string :prepare
      t.belongs_to :contract

      t.timestamps
    end
  end
end
