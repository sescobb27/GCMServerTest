class Coupon < ActiveRecord::Base
  attr_accessible :company_name, :coupon_msg, :coupon_name, :coupon_num, :coupon_state

  def to_h
  	{ coupon_name: self.coupon_name, coupon_msg: self.coupon_msg }
  end
end
