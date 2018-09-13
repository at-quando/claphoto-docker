class AddStatusToContract < ActiveRecord::Migration[5.1]
  def change
    add_column :contracts, :paid, :boolean, default: 0
  end
end
