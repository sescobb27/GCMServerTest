# Read about factories at https://github.com/thoughtbot/factory_girl
require 'ffaker'

FactoryGirl.define do
  factory :user do |user|
    user.name {Faker::Name.name}
    user.email {Faker::Internet.email}
    user.birthday {rand(10.years).ago.to_date}
    user.gcm_device_id {SecureRandom.urlsafe_base64}
    user.secure_token {SecureRandom.urlsafe_base64}
    factory :user_with_likes do
    end
    factory :user_with_coupons do
    end
  end
end
