class Coupon < ActiveRecord::Base

    # ===========================Attributes=====================================
  	attr_accessible :entity_id, :coupon_msg, :coupon_name, :coupon_num,
  					:coupon_image
	  has_attached_file :coupon_image,
  		:styles => { :small => '100x100>' },
  		:url  => '/assets/users/:id/:style/:basename.:extension',
      :path => ':rails_root/public/assets/users/:id/:style/:basename.:extension',
      :default_url => ''
    # ===========================end attributes=================================

    # ===========================model validations=============================
    validates_attachment_size :coupon_image, less_than: 2.megabytes
    validates_attachment_content_type :coupon_image, :content_type => %w(image/jpeg image/png)
    {
      coupon_msg: 'Which is about your coupon?',
      coupon_name: 'Which is the title of your coupon?',
      coupon_num: 'How many coupons do you want to make?',
    }.each do |attr, msg|
    	validates_presence_of attr, message: "#{msg}"
    end
      validates_numericality_of :coupon_num, :only_integer => true,
                                greater_than_or_equal_to: 10,
                                message: 'Sorry your promotion has to be for more than 10 people'
      validates_length_of :coupon_msg, within:10..50,
                          too_long: 'The coupon message length must be less than 50',
                          too_short: 'The coupon message length must be greater than 10'
      validates_length_of :coupon_name, within: 2..20,
                          too_long: 'maximum value size is 20 chars',
                          too_short: 'the value length must be at least 2 chars'
    # =============================end validations==============================

    # =============================model relationship===========================
    belongs_to :entity, class_name: 'Entity', foreign_key: 'entity_id',
                inverse_of: :coupons
    has_many :user_coupons
    has_many :users, through: :user_coupons
    # =============================end relationship=============================

    # convert coupon object into a hash to send as json
  	def to_h
  		coupon_hash = Hash.new
  		coupon_hash[:coupon_name] = self.coupon_name
  		coupon_hash[:coupon_msg] = self.coupon_msg
  		coupon_hash[:coupon_image] = self.coupon_image unless self.coupon_image.url.empty?
  		coupon_hash
  	end

  	private
    # task to be executed every day at 12am (midnight)
    # update every coupon state to false which its state is true, it means every
    # expire every coupon per day
  	def self.change_state
  		Coupon.update_all({ :coupon_state => false }, { :coupon_state => true })
  		puts 'hola update'
  	end
end