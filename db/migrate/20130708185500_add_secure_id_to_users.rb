class AddSecureIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :secure_id, :string, null: false, limit: 8
    add_index :users, :secure_id, unique: true
  end
end
