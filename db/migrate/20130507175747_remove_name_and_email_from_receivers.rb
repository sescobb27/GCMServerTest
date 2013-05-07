class RemoveNameAndEmailFromReceivers < ActiveRecord::Migration
  def up
      remove_column :receivers, :email
      remove_column :receivers, :name
      add_column :receivers, :user_id, :integer, null: false
  end

  def down
      add_column :receivers, :name, :string, :null => false
      add_column :receivers, :email, :string,:null => false
      remove_column :receivers, :user_id
  end
end
