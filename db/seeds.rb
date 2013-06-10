# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# default categories
CATEGORIES = {
    restaurant: {
        gourmet: 'Gourmet', typical: 'Typical', fast: 'Fast Food',
        arabic: 'Arabic', italian: 'Italian', mexican: 'Mexican'
    },
    disco_bar: {
        shots: 'Shots', cocktails: 'Cocktails', crossover: 'Crossover',
        tropical: 'Tropical', tango: 'Tango', fonda: 'Fonda',
        electro: 'Techno', reggaeton: 'Reggaeton'
    }
}

# CATEGORIES is a Hash of Hashes containing the valid categories for each type
CATEGORIES.each_value do |type_dict|
    type_dict.each_value do |category_name|
        Category.create category_name: category_name
    end
end
# default types
VALID_TYPES = { restaurant: 'Restaurant', disco: 'Disco', bar: 'Bar' }

# VALID_TYPES is a hash containing the valid types
VALID_TYPES.each_value do |type_name|
    Type.create type_name: type_name
end

types = Type.all
types.each do |type|
  case type.type_name
    when VALID_TYPES[:restaurant]
      type.add_category CATEGORIES[:restaurant]
    when VALID_TYPES[:disco]
      type.add_category CATEGORIES[:disco_bar]
    when VALID_TYPES[:bar]
      type.add_category CATEGORIES[:disco_bar]
  end
end
