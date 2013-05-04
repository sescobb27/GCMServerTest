class EntityCategory < ActiveRecord::Base
    # =============================model relationship===========================
    belongs_to :category
    belongs_to :entity
    # =============================end relationship=============================
end
