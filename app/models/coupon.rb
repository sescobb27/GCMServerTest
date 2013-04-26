class Coupon < ActiveRecord::Base
  include CommonValidations
  	attr_accessible :company_name, :coupon_msg, :coupon_name, :coupon_num,
  					:coupon_state, :coupon_image
	has_attached_file :coupon_image,
  		:styles => { :small => "100x100>" },
  		:url  => "/assets/users/:id/:style/:basename.:extension",
        :path => ":rails_root/public/assets/users/:id/:style/:basename.:extension",
        :default_url => ""
    validates_attachment_size :coupon_image, :less_than => 2.megabytes
    validates_attachment_content_type :coupon_image, :content_type => ['image/jpeg', 'image/png']

    { company_name: "Which is your company name?",
    	coupon_msg: "Which is about your coupon?",
    	coupon_name: "Which is the title of your coupon?",
    	coupon_num: "How many coupons do you want to make?",
    }.each &validate
    #  do |attr, msg|
    # 	validates_presence_of attr, message: "#{msg}"
    # end

	def to_h
		coupon_hash = Hash.new
		coupon_hash[:coupon_name] = self.coupon_name
		coupon_hash[:coupon_msg] = self.coupon_msg
		coupon_hash[:coupon_image] = self.coupon_image unless self.coupon_image.url.empty?
		coupon_hash
	end

	private
	def self.change_state
		Coupon.update_all({ :coupon_state => false }, { :coupon_state => true })
		puts "hola update"
	end
end
