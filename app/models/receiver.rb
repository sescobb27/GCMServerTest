class Receiver < ActiveRecord::Base
  attr_accessible :name, :email,:gcm_device_id
  belongs_to :device, class_name: "Gcm::Device",foreign_key: "gcm_device_id"
  def self.exist?(regId)
  	device = Gcm::Device.where registration_id: regId
  	if device.size == 0
		  false
	  else
		  true
  	end
  end
  def self.add_to_database(req_params)
  	gcm_device = Gcm::Device.new registration_id: req_params["regId"]
  	gcm_device.save
  	Receiver.create name: req_params["name"], email: req_params["email"], gcm_device_id: gcm_device.id
  end
end