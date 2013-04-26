module CommonValidations
	validate = new Proc do |attr,msg|
		validates_presence_of attr, message: "#{msg}"
	end
end