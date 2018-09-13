class CreateViewers < ActiveRecord::Migration[5.1]
  def change
    create_table :viewers do |t|
      t.string :name_class
      t.string :school
      t.string :school_year
      t.string :email
      t.string :pwd
      t.string :drive_link

      t.timestamps
    end
  end
end
