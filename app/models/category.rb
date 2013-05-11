class Category < ActiveRecord::Base

    # ===========================Attributes=====================================
    attr_accessible :category_name, :category_description
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
    # ===========================end attributes=================================

    # ===========================model validations=============================
    validates_uniqueness_of :category_name, message: 'This category name already exist'
    validates_presence_of :category_name, message: 'Category name can\'t be blank'
    validates_length_of :category_name, too_short: 'Category name must have at least 3 characters length'
    # =============================end validations==============================

    # =============================model relationship===========================
    has_many :type_categories
    has_many :types, through: :type_categories
    has_many :entity_categories
    has_many :entities, through: :entity_categories
    # =============================end relationship=============================

end
