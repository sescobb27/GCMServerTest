class Entity < ActiveRecord::Base

	VALID_TYPES = { restaurant: "Restaurant", disco: "Disco", bar: "Bar" }
  	attr_accessible :coupon_id, :entity_category_id, :entity_email,
  					:entity_name, :entity_telephone_number, :entity_type
	validates_inclusion_of :entity_type, in: VALID_TYPES.values
	validates_format_of :entity_email,
				with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create
	validates_uniqueness_of :entity_email
	{ entity_name: "Which is your company name?", 
		entity_email: "Which is your company email?",
		entity_telephone_number: "tell us your contact number"
	}.each do |attr, msg|
	 	validates_presence_of attr, message: "#{msg}"
	 	if attr == :entity_telephone_number
	 		validates_format_of attr, with: /(\d\d\d-\d\d-\d\d)|(\d{7})/,
	 					message: "The telephone number format must be ###-##-## or #######"
	 	else
	 		validates_length_of attr, within:2..20,
 						too_long: "maximum value size is 20 chars",
 						too_short: "the value length must be at least 2 chars"

	 	end
	end

end
