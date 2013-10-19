class ChangeAuthTokenToUserCoupons < ActiveRecord::Migration
  def up
    change_column :user_coupons, :auth_token, :string, limit: 22, null: false
    add_index :user_coupons, :auth_token, unique: true
  end

  def down
    change_column :user_coupons, :auth_token, :string, limit: 10, null: false
    remove_index :user_coupons, :auth_token
  end
end
