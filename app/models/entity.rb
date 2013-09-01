class Entity < ActiveRecord::Base

  # ===========================Attributes=====================================
  attr_accessible :entity_email, :entity_name, :entity_telephone_number#, :categories
  # ===========================end attributes=================================
  	
  # ===========================model validations=============================
  validates :entity_email,
              uniqueness: { case_sensitive: false, message: 'This email already exist' },
              length: { 
                within: 10..50,
                too_long: 'maximum value size is 50 chars',
                too_short: 'the value length must be at least 10 chars'
              },
              format: {
                with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,
                on: :create,
                message: 'Wrong email format'
              }
  validates :entity_name,
              uniqueness: { case_sensitive: false, message: 'This name already exist' },
              length: { 
                within: 2..50,
                too_long: 'maximum value size is 50 chars',
                too_short: 'the value length must be at least 2 chars'
              }
  validates_presence_of :entity_telephone_number, :entity_email, :entity_name
  validates_format_of :entity_telephone_number, with: /(\d\d\d-\d\d-\d\d)|(\d{7})/,
            message: 'The contact number format must be ###-##-## or #######'
  validate :presence_of_categories
  # =============================end validations==============================

  # =============================model relationship===========================
  has_many :coupons, inverse_of: :entity
  has_many :entity_categories
  has_many :categories, through: :entity_categories
  has_many :user_entities
  has_many :users, through: :user_entities
  has_many :entity_locations
  has_many :locations, through: :entity_locations
  # =============================end relationship=============================
  
  def add_location(arr_locations)
      loc = Location.where name: arr_locations
      loc.each do |location|
          self.locations.push location
      end
      self.save
  end

  def presence_of_categories
      unless self.categories.length > 0
          errors.add :categories, 'You must have at least 1 category'
      end
  end
end
