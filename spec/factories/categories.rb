# Read about factories at https://github.com/thoughtbot/factory_girl
require 'ffaker'

FactoryGirl.define do
  factory :category do |category|
      category.category_name {Faker::Name.name}
      category.category_description {'lorem ipsum '*4}
  end
end
