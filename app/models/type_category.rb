class TypeCategory < ActiveRecord::Base
    # attr_accessible :category_id, :type_id
    # =============================model relationship===========================
    belongs_to :type
    belongs_to :category
    # =============================end relationship=============================
end
