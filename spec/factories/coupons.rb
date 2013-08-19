# Read about factories at https://github.com/thoughtbot/factory_girl
require 'ffaker'

FactoryGirl.define do
  factory :coupon do |coupon|
    coupon.coupon_msg {Faker::Lorem.characters 20}
    coupon.coupon_name {Faker::Name.name}
    coupon.coupon_num {rand 1000}
    association :entity, factory: :entity
    factory :coupon_with_users do
        after(:create) do |coupon, evaluator|
            number_of_users = 20
            FactoryGirl.create_list(:user, number_of_users, coupon: coupon)
        end
    end
  end
end
