class Category < ActiveRecord::Base

    # ===========================Attributes=====================================
    attr_accessible :category_name, :category_description, :picture
    has_attached_file :picture,
                      :styles => { :medium => '400x400>' },
                      :url  => '/assets/users/:id/:style/:basename.:extension',
                      :path => ':rails_root/public/assets/users/:id/:style/:basename.:extension',
                      :default_url => ''
    # ===========================end attributes=================================

    # ===========================model validations=============================
    validates_uniqueness_of :category_name, message: 'This category name already exist'
    validates_presence_of :category_name, message: 'Category name can\'t be blank'
    validates_length_of :category_name, minimum: 3 ,too_short: 'Category name must have at least 3 characters length'
    validates_attachment_size :picture, less_than: 3.megabytes
    validates_attachment_content_type :picture, :content_type => %w(image/jpeg image/png)
    # =============================end validations==============================

    # =============================model relationship===========================
    has_many :type_categories
    has_many :types, through: :type_categories
    has_many :entity_categories
    has_many :entities, through: :entity_categories
    # =============================end relationship=============================

end
