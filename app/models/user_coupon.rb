class UserCoupon < ActiveRecord::Base
  # attr_accessible :auth_token, :coupon_id, :user_id
  belongs_to :user, foreign_key: 'user_id'
  belongs_to :coupon, foreign_key: 'coupon_id'
end
