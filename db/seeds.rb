# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Category::CATEGORIES is a Hash of Hashes containing the valid categories for each type
Category::CATEGORIES.each_value do |type_dict|
    type_dict.each_value do |category_name|
        Category.create category_name: category_name
    end
end

# Type::VALID_TYPES is a hash containing the valid types
Type::VALID_TYPES.each_value do |type_name|
    Type.create type_name: type_name
end