class Type < ActiveRecord::Base
    attr_accessible :type_name, :type_description
    # =============================model relationship===========================
    has_many :type_categories
    has_many :categories, through: :type_categories
    # =============================end relationship=============================

end
