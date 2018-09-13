class CreatePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :pictures do |t|
      t.text :pictureId
      t.text :name
      t.string :mimeType
      t.string :folder
      t.belongs_to :viewer

      t.timestamps
    end
  end
end
