class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.text :content
      t.text :description
      t.integer :kind, default: 0
      t.string :title
      t.string :key

      t.timestamps
    end
  end
end
