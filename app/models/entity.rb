class Entity < ActiveRecord::Base
  	attr_accessible :coupon_id, :entity_category_id, :entity_email,
  					:entity_name, :entity_telephone_number, :entity_type
	{ entity_name: "Which is your company name?", 
		entity_email: "Which is your company email?",
		entity_telephone_number: "tell us your contact number"
	}.each do |attr, msg|
	 	validates_presence_of attr, message: "#{msg}"
	end

  	protected
  	VALID_TYPES = { restaurant: "Restaurant", disco: "Disco", bar: "Bar" }
end
