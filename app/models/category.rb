class Category < ActiveRecord::Base

    # ===========================Attributes=====================================
    attr_accessible :category_name, :category_description
    RESTAURANT_CATEGORIES = { gourmet: 'Gourmet', typical: 'Typical', fast: 'Fast Food',
                         arabic: 'Arabic', italian: 'Italian', mexican: 'Mexican' }
    BAR_CATEGORIES = {}
    DISCO_CATEGORIES = {}
    # ===========================end attributes=================================

    # =============================model relationship===========================
    has_many :type_categories
    has_many :types, through: :type_categories
    has_many :entity_categories
    has_many :entities, through: :entity_categories
    # =============================end relationship=============================

end
