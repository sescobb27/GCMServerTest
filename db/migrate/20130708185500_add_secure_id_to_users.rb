class AddSecureIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :secure_token, :string, null: false, limit: 22
    add_index :users, :secure_token, unique: true
  end
end
