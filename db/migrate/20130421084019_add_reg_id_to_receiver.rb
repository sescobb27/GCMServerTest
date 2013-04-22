class AddRegIdToReceiver < ActiveRecord::Migration
  def change
    add_column :receivers, :gcm_device_id, :integer, :null => false
  end
end
