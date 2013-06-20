class RemoveIndexNameToUsers < ActiveRecord::Migration
  def up
    remove_index :users, column: :name
  end

  def down
    add_index :users, :name, unique: false
  end
end
