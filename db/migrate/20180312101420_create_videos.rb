class CreateVideos < ActiveRecord::Migration[5.1]
  def change
    create_table :videos do |t|
      t.string :video
      t.integer :kind, default: 0

      t.timestamps
    end
  end
end
