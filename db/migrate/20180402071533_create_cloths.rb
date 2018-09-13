class CreateCloths < ActiveRecord::Migration[5.1]
  def change
    create_table :cloths do |t|
      t.string :name
      t.string :hire
      t.string :lost

      t.timestamps
    end
  end
end
