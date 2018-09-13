class AddColumnToPhotographers < ActiveRecord::Migration[5.1]
  def change
    add_column :contract_photographers, :note, :string
    add_column :contract_photographers, :paid, :boolean, default: 0
    add_column :contract_photographers, :role, :string
  end
end
