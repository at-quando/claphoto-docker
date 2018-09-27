class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.string :title
      t.string :description
      t.string :image
      t.belongs_to :article

      t.timestamps
    end
  end
end
