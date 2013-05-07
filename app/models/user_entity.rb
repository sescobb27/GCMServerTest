class UserEntity < ActiveRecord::Base
  # attr_accessible :entity_id, :user_id
  # =============================model relationship===========================
  belongs_to :user, foreign_key: 'user_id'
  belongs_to :entity, foreign_key: 'entity_id'
  # =============================end relationship=============================
end
