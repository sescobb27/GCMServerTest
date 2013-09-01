# Read about factories at https://github.com/thoughtbot/factory_girl
require 'ffaker'

FactoryGirl.define do
    factory :entity do |entity|
        entity.entity_email {Faker::Internet.email}
        entity.entity_name {Faker::Name.name}
        entity.entity_telephone_number {"#{rand 10}"*7}
        entity.categories { FactoryGirl.create_list(:category, 1) }

        # number_of_coupons is declared as an ignored attribute and available in
        # attributes on the factory, as well as the callback via the evaluator
        ignore do
            number_of_coupons 20
            number_of_users 20
            number_of_categories 0
        end

        factory :entity_with_coupons do
            after(:create) do |entity, evaluator|
                FactoryGirl.create_list(:coupon, evaluator.number_of_coupons, entity: entity)
            end
        end

        factory :entity_with_categories do
            before(:create) do |entity, evaluator|
                FactoryGirl.create_list(:category, evaluator.number_of_categories, entities: [entity])
            end
        end

        factory :entity_with_users do
            after(:create) do |entity, evaluator|
                FactoryGirl.create_list(:user, evaluator.number_of_users, name: "Foo Bar Escobar", entities: [entity])
            end
        end

        factory :entity_with_locations do
        end
    end
end
