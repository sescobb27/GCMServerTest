# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do |user|
    user.name ''
    user.email ''
    user.birthday ''
    user.gcm_device_id ''
    user.entities ''
    user.secure_token ''
  end
end
