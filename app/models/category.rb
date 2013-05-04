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
                    electro: 'Techno'
            }
    }
    # ===========================end attributes=================================

    # =============================model relationship===========================
    has_many :type_categories
    has_many :types, through: :type_categories
    has_many :entity_categories
    has_many :entities, through: :entity_categories
    # =============================end relationship=============================

end
