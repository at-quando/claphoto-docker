class CreateAdminSecrets < ActiveRecord::Migration[5.1]
  def change
    create_table :admin_secrets do |t|
      t.string :token_secret

      t.timestamps
    end
  end
end
