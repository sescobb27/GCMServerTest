class User < ActiveRecord::Base

  # ===========================Attributes=====================================
  attr_accessible :birthday, :email, :name
  # ===========================end attributes=================================

  # ===========================model validations============================
  validates_uniqueness_of :email
  # =============================end validations==============================

  # =============================model relationship===========================
  has_one :receiver
  has_many :user_entities
  has_many :entities, through: :user_entities
  has_many :user_coupons
  has_many :coupons, through: :user_coupons
  # =============================end relationship=============================

  def add_entities(entities_arr)
    entities_arr = Entity.where entity_name: entities_arr
    entities_arr.each do |entity|
      self.entities << entity
    end
    self.save
  end

end
