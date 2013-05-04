class Type < ActiveRecord::Base

    # ===========================Attributes=====================================
    attr_accessible :type_name, :type_description
    VALID_TYPES = { restaurant: 'Restaurant', disco: 'Disco', bar: 'Bar' }
    # ===========================end attributes=================================

    # ===========================module validations=============================
    validates_inclusion_of :type_name, in: VALID_TYPES.values
    # =============================end validations==============================

    # =============================model relationship===========================
    has_many :type_categories
    has_many :categories, through: :type_categories
    # =============================end relationship=============================

end
