class Coupon < ActiveRecord::Base
  	attr_accessible :company_name, :coupon_msg, :coupon_name, :coupon_num,
  					:coupon_state, :coupon_image
	has_attached_file :coupon_image,
  		:styles => { :small => "100x100>" },
  		:url  => "/assets/users/:id/:style/:basename.:extension",
        :path => ":rails_root/public/assets/users/:id/:style/:basename.:extension"
    validates_attachment_size :coupon_image, :less_than => 2.megabytes
    validates_attachment_content_type :coupon_image, :content_type => ['image/jpeg', 'image/png']

    { company_name: "What is your company name?",
    	coupon_msg: "What is about your coupon?",
    	coupon_name: "What is the title of your coupon?",
    	coupon_num: "How many coupons do you want to make?",
    }.each do |attr, msg|
    	validates_presence_of attr, message: "#{msg}"
    end

	def to_h
		{ coupon_name: self.coupon_name, coupon_msg: self.coupon_msg }
	end
end
