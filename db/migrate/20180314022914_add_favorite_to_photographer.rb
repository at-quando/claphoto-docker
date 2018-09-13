class AddFavoriteToPhotographer < ActiveRecord::Migration[5.1]
  def change
    add_column :photographers, :favorite, :boolean
  end
end
