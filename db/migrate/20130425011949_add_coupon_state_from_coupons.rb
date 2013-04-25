class AddCouponStateFromCoupons < ActiveRecord::Migration
  def change
  	add_column :coupons, :coupon_state, :boolean , default: true
  	remove_column :coupons,:expiration_date
  end
end
