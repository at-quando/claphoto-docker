class AddColumnToViewer < ActiveRecord::Migration[5.1]
  def change
    add_column :viewers, :typeFile, :integer
    add_column :cloths, :link, :string
    add_column :accessories, :link, :string
  end
end
