class Type < ActiveRecord::Base

  # ===========================Attributes=====================================
  attr_accessible :type_name, :type_description
  VALID_TYPES = { restaurant: 'Restaurant', disco: 'Disco', bar: 'Bar' }
  # ===========================end attributes=================================

  # ===========================model validations=============================
  # validates_inclusion_of :type_name, in: VALID_TYPES.values
  validates_presence_of :type_name
  validates_uniqueness_of :type_name, message: 'This type name already exist'
  validates_length_of :type_name, minimum: 3, message: 'Type name must have at least 3 characters length'
  after_save :add_to_valid_types
  # =============================end validations==============================

  # =============================model relationship===========================
  has_many :type_categories
  has_many :categories, through: :type_categories
  # =============================end relationship=============================


  def add_category(category_hash)
    category_hash.each_value do |cat_name|
      self.categories << Category.where( category_name: cat_name ).first
    end
    self.save
  end

  private
  # after save, add the new type to de valid types hash for future validations
  def add_to_valid_types
    VALID_TYPES[self.type_name.gsub(/\s/,'_')] = self.type_name.capitalize
  end
end
