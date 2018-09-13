class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.string :name
      t.belongs_to :article

      t.timestamps
    end
  end
end
