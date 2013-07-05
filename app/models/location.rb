class Location < ActiveRecord::Base

  # ===========================Attributes=====================================
  attr_accessible :name
  # ===========================end attributes=================================

  # =============================model relationship===========================
  has_many :entity_locations
  has_many :locations, through: :entity_locations
  # =============================end relationship=============================
end
