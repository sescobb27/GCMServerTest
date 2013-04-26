class AddAttachmentCouponImageToCoupons < ActiveRecord::Migration
  def self.up
    change_table :coupons do |t|
      t.attachment :coupon_image
    end
  end

  def self.down
    drop_attached_file :coupons, :coupon_image
  end
end
