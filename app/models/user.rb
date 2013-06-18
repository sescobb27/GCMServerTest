class User < ActiveRecord::Base
  # ===========================Attributes=====================================
  attr_accessible :birthday, :email, :name, :gcm_device_id
  # ===========================end attributes=================================

  # ===========================model validations============================
  validates_uniqueness_of :email
  validates_length_of :name, within: 10..50,
                      too_long: 'Names value size must be less than 50',
                      too_short: 'Names value size must be greater than 10'
  validates_format_of :email,
                      with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,
                      message: 'Invalid email format'
  { birthday: 'You must have at least 10 years old', 
    email: 'Invalid email',
    name: 'Invalid name'
  }.each do |attr,msg|
    validates_presence_of attr, msg: "#{msg}"
  end
  # =============================end validations==============================

  # =============================model relationship===========================
  has_many :user_entities
  has_many :entities, through: :user_entities
  has_many :user_coupons
  has_many :coupons, through: :user_coupons
  belongs_to :device, class_name: 'Gcm::Device',foreign_key: 'gcm_device_id'
  # =============================end relationship=============================

  def self.add_to_database(req_params, device)
    birth = Date.get_date_from_params req_params
    user = User.new name: req_params[:name],
                    email: req_params[:email],
                    birthday: birth,
                    gcm_device_id: device.id

    # en los param viene un atributo likes que son unos strings concatenados con ','
    # que hacen referencia a las entidades que le gustan al usuario
    likes = to_str_arr req_params['likes'].to_s
    # asignar entidades (restaurantes, bares o discotecas) al usuario
    user.add_entities likes
    user
  end

  def self.to_str_arr(str)
    str.split(',').each do |like|
      like.strip!
    end
  end

  def add_entities(entities_arr)
    entities_arr = Entity.where entity_name: entities_arr
    entities_arr.each do |entity|
      self.entities << entity
    end
  end

end
