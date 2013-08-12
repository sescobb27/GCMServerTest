class User < ActiveRecord::Base
  # ===========================Attributes=====================================
  attr_accessible :birthday, :email, :name, :gcm_device_id, :entities, :secure_token
  # ===========================end attributes=================================

  # ===========================model validations============================
  validates_uniqueness_of :email
  validates_length_of :name, within: 10..50,
                      too_long: 'value size must be less than 50',
                      too_short: 'value size must be greater than 10'
  validates_format_of :email,
                      with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,
                      message: 'Invalid format'
  { birthday: 'You must have at least 10 years old', 
    email: 'can\'t be blank',
    name: 'can\'t be blank'
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

  token_generator = lambda { SecureRandom.urlsafe_base64 }
  # find companies as entities for users likes, then parse the birthday provided
  # by user and finally instantiate new user object with the provided attributes
  # and returns it
  def self.add_to_database(req_params, device, arr_entities)
    entities = Entity.where entity_name: arr_entities
    birth = Date.get_date_from_params req_params
    User.new name: req_params[:name],
                    email: req_params[:email],
                    birthday: birth,
                    gcm_device_id: device.id,
                    entities: entities,
                    secure_token: token_generator.call
  end

  def add_entities(entities_arr)
    entities_arr = Entity.where entity_name: entities_arr
    entities_arr.each do |entity|
      self.entities << entity
    end
  end

end
