class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :gcm_device_id, :integer, null: false
    drop_table :receivers
  end
end
