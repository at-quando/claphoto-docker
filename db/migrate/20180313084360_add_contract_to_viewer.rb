class AddContractToViewer < ActiveRecord::Migration[5.1]
  def change
    add_reference :viewers, :contract, foreign_key: true
    remove_column :viewers, :name_class
    remove_column :viewers, :school
    remove_column :viewers, :school_year
  end
end
