class CreateUserCoupons < ActiveRecord::Migration
  def change
    create_table :user_coupons do |t|
      t.integer :user_id, null: false
      t.integer :coupon_id, null: false
      t.string :auth_token, null: false, limit: 10

      t.timestamps
    end
    add_index :user_coupons,:user_id
    add_index :user_coupons, :coupon_id
  end
end
