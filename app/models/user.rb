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
  # =============================end relationship=============================



end
