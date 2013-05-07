class Receiver < ActiveRecord::Base
  attr_accessible :gcm_device_id
  belongs_to :device, class_name: 'Gcm::Device',foreign_key: 'gcm_device_id'
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'

  def self.exist?(regId)
  	Gcm::Device.where(registration_id: regId).first
  end

  def self.add_to_database(req_params)
  	gcm_device = Gcm::Device.new registration_id: req_params['regId']
  	gcm_device.save

    user = User.new name: req_params['name'], email: req_params['email']
    user.birthday = req_params['birthday'] unless req_params['birthday'].empty?

    if user.save
      Receiver.create gcm_device_id: gcm_device.id, user: user
    end

  end
end