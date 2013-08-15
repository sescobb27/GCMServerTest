class CouponSerializer < ActiveModel::Serializer
  attributes :id, :coupon_msg, :coupon_name, :entity_id, :coupon_image
end
