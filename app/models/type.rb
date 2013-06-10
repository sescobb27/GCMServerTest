class Type < ActiveRecord::Base

  # ===========================Attributes=====================================
  attr_accessible :type_name, :type_description
  has_attached_file :picture,
                    :styles => { :medium => '400x400>' },
                    :url  => '/assets/users/:id/:style/:basename.:extension',
                    :path => ':rails_root/public/assets/users/:id/:style/:basename.:extension',
                    :default_url => ''
  # ===========================end attributes=================================

  # ===========================model validations=============================
  validates_presence_of :type_name
  validates_uniqueness_of :type_name, message: 'This type name already exist'
  validates_length_of :type_name, minimum: 3, message: 'Type name must have at least 3 characters length'
  validates_attachment_size :picture, less_than: 3.megabytes
  validates_attachment_content_type :picture, :content_type => %w(image/jpeg image/png)
  # =============================end validations==============================

  # =============================model relationship===========================
  has_many :type_categories
  has_many :categories, through: :type_categories
  # =============================end relationship=============================
  scope :only_names, select(:type_name)


  def add_category(category_hash)
    category_hash.each_value do |cat_name|
      self.categories << Category.where( category_name: cat_name ).first
    end
    self.save
  end

=begin
  private
  # after save, add the new type to de valid types hash for future validations
  def add_to_valid_types
    VALID_TYPES[self.type_name.gsub(/\s/,'_')] = self.type_name.capitalize
  end
=end
end
