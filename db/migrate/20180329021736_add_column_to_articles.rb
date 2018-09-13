class AddColumnToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :url, :string
    add_column :articles, :favorite, :integer
  end
end
