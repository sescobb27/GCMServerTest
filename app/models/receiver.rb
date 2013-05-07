class Receiver < ActiveRecord::Base
  attr_accessible :gcm_device_id
  belongs_to :device, class_name: 'Gcm::Device',foreign_key: 'gcm_device_id'
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'

  def self.exist?(regId)
  	Gcm::Device.where(registration_id: regId).first
  end

  def self.add_to_database(req_params)
  	gcm_device = Gcm::Device.new registration_id: req_params['regId']

    user = User.new name: req_params['name'], email: req_params['email']
    user.birthday = req_params['birthday'] unless req_params['birthday'].empty?

    # en los param viene un atributo likes que son unos strings concatenados con ','
    # que hacen referencia a las entidades que le gustan al usuario
    likes = req_params['likes'].to_s.split(',').each do |like|
      like.strip!
    end
    # asignar entidades (restaurantes, bares o discotecas) al usuario
    user.entities = Entity.where entity_name: likes

    # si el usuario es agregado satisfactoriamente tambien guardar el gcm::device
    # y el receiver
    if user.save
      gcm_device.save
      Receiver.create gcm_device_id: gcm_device.id, user: user
    end

  end
end