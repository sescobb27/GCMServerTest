# Read about factories at https://github.com/thoughtbot/factory_girl
require 'ffaker'

FactoryGirl.define do
    factory :user do |user|
        user.name {Faker::Name.name}
        user.email {Faker::Internet.email}
        user.birthday {11.years.ago.to_date}
        user.gcm_device_id {SecureRandom.urlsafe_base64}
        user.secure_token {SecureRandom.urlsafe_base64}

        ignore do
            number_of_likes 20
            number_of_coupons 20
        end

        factory :user_with_likes do
            after(:create) do |user, evaluator|
                FactoryGirl.create_list(:entity, evaluator.number_of_likes, users: [user])
            end
        end

        factory :user_with_coupons do
            after(:create) do |user, evaluator|
                FactoryGirl.create_list(:coupon, evaluator.number_of_coupons, users: [user])
            end
        end
    end
end
