# Read about factories at https://github.com/thoughtbot/factory_girl
require 'ffaker'

FactoryGirl.define do
    factory :coupon do |coupon|
        coupon.coupon_msg 'Coupon msg for test'
        coupon.coupon_name 'Coupon name for test'
        coupon.coupon_num 50
        entity
    end
end
