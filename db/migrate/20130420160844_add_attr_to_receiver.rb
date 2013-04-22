class AddAttrToReceiver < ActiveRecord::Migration
  def change
    add_column :receivers, :name, :string, :null => false
    add_column :receivers, :email, :string,:null => false
  end
end
