class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.string :photo
      t.integer :kind, default: 0

      t.timestamps
    end
  end
end
