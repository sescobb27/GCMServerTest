class RemoveCouponStateFromCoupons < ActiveRecord::Migration
  def change
  	remove_column :coupons, :coupon_state
  end
end
