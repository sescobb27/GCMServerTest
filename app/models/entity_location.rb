class EntityLocation < ActiveRecord::Base
  # =============================model relationship===========================
  belongs_to :entity
  belongs_to :location
  # =============================end relationship=============================
end
