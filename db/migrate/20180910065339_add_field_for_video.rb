class AddFieldForVideo < ActiveRecord::Migration[5.1]
  def change
    add_column :videos, :title, :string
    add_column :videos, :desc, :text
  end
end
