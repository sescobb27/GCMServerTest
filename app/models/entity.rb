class Entity < ActiveRecord::Base

	# ===========================Attributes=====================================
  attr_accessible :entity_email, :entity_name, :entity_telephone_number
  # ===========================end attributes=================================
  	
  # ===========================model validations=============================
	validates_format_of :entity_email,
				with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create
	validates_uniqueness_of :entity_email, :entity_name, message: 'This name or email already exist'
	{ entity_name: 'Which is your company name?', 
		entity_email: 'Which is your company email?',
		entity_telephone_number: 'tell us your contact number'
	}.each do |attr, msg|
	 	validates_presence_of attr, message: "#{msg}"
	 	if attr == :entity_telephone_number
	 		validates_format_of attr, with: /(\d\d\d-\d\d-\d\d)|(\d{7})/,
	 					message: 'The contact number format must be ###-##-## or #######'
	 	else
	 		validates_length_of attr, within:2..20,
 						too_long: 'maximum value size is 20 chars',
 						too_short: 'the value length must be at least 2 chars'

	 	end
	end
	# =============================end validations==============================

	# =============================model relationship===========================
	has_many :coupons, inverse_of: :entity
  has_many :entity_categories
  has_many :categories, through: :entity_categories
  has_many :user_entities
  has_many :user, through: :user_entities
	# =============================end relationship=============================
end
