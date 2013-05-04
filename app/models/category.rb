class Category < ActiveRecord::Base
    attr_accessible :category_name, :category_description
    # =============================model relationship===========================
    has_many :type_categories
    has_many :types, through: :type_categories
    has_many :entity_categories
    has_many :entities, through: :entity_categories
    # =============================end relationship=============================
end
