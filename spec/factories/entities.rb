# Read about factories at https://github.com/thoughtbot/factory_girl
require 'ffaker'

FactoryGirl.define do
  factory :entity do |entity|
    entity.entity_email {Faker::Internet.email}
    entity.entity_name {Faker::Name.name}
    entity.entity_telephone_number {"#{rand 10}"*7}
    factory :entity_with_coupons do
        after(:create) do |entity, evaluator|
            number_of_coupons = 20
            FactoryGirl.create_list(:coupon, number_of_coupons, entity: entity)
        end
    end
    factory :entity_with_categories do
    end
    factory :entity_with_users do
        after(:create) do |entity, evaluator|
            number_of_users = 20
            FactoryGirl.create_list(:user, number_of_users, entity: entity)
        end
    end
    factory :entity_with_locations do
    end
  end
end
