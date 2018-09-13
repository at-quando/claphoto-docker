class ChangeContract < ActiveRecord::Migration[5.1]
  def change
    remove_column :contracts, :type
    add_column :contracts, :typeContract, :integer
  end
end
