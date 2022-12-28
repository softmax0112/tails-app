class CreateAdminDatabases < ActiveRecord::Migration[7.0]
  def change
    create_table :admin_databases do |t|
      t.string :name
      t.string :hostname
      t.string :username
      t.string :password_digest
      t.integer :port
      t.string :schema

      t.timestamps
    end
  end
end
