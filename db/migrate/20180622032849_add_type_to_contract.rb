class AddTypeToContract < ActiveRecord::Migration[5.1]
  def change
    add_column :contracts, :type, :integer
    add_column :contracts, :scenario, :string
  end
end
