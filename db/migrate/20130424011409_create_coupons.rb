class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.datetime :expiration_date
      t.integer :coupon_num, null: false
      t.string :coupon_name, null: false, limit: 20
      t.string :coupon_msg, null: false, limit: 50
      t.boolean :coupon_state, default: true
      t.string :company_name, null: false, limit: 20

      t.timestamps
    end
  end
end
